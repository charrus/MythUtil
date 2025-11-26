#!/usr/bin/perl -w
package scan_database;
use strict;
use Exporter;
use LWP::UserAgent;  # needs 'sudo apt-get install libwww-perl'

#Version 1.01 25 Aug 2015.     APISupported ValidatePost and GetAPIParameters added.
#Version 1.02 26 Aug 2015.     Changes to ValidatePost:
#Version 1.03 15 Sep 2015.     Fixed bug:  Misuse of $_ in KillEscapes causes various problems with escape sequences.
#Version 1.04. 23 Sept 2015.   ValidatePost 'test' shows values extracted. 
#Version 1.05  24 Sept 2015.   Allow ReadBackend in scalar context - return 1 if ok, 0 if host not responding.
#                              Still die in void context.
#Version 1.06  29 Sept 2015.   Allow external access via 'our' %APICallingParameters.
#                              Fix bug if wsdl shows API call has no calling parameters.  Affects APISupported and 
#                              GetAPIParameters.
#Version 1.07   1 Oct 2015.    Rework of wsdl with no parameters 29/9/15.  (oops!).
#version 1.08  17 Oct 2015     Extend APISupported to return 1 if a get, 2 if a post. 
#                              Tweak to accept 0.28 wsdl format
#                              ValidatePost to return the POST response eg <bool>true</bool>.
#                              ValidatePost to check that it is a post function
#Version 1.09  10 Nov 2015     Request compressed content in ReadBackend.
#Version 1.10  10 May 2022     Allow new API inteface on :6744 - tags eg <VideoSource version ...> as well as <VideoSource>
#              12 May 2022     fix to regex in APISupported  changed \s? to \s* 
#Version 1.11  19 May 2022     FillHashofHash improved - use regex throughout instead of index.
#Version 1.12   1 June 2022    Ditto for GetAllFields, Corrected count entry in FillHashofHash 
#Version 1.13  13 June 2022    treat tags like  <Value xsi:nil="true"/> as blank in FillHashofHash and GetAllFields
#              15 June 2022    Fix bug in setting default start/end in GetAllFields           


# DOCUMENTATION:  See https://www.mythtv.org/wiki/Perl_API_examples


our $VERSION     = 1.13;
our @ISA         = qw(Exporter);
our @EXPORT      = qw(ReadBackend FillHashofHash GetAllFields APISupported ValidatePost GetDBinfo GetDBheader GetAPIParameters);

my $browseropen=0;
my $browser;
my $counter;
our %APICallingParameters;
our %APItype;


#steering file for GetDBHeader and GetDBinfo
my %steer = (
    getchannelinfolist  => ['Channel/GetChannelInfoList', 'ChannelInfo','ChannelInfos'],
    getrecordedlist     => ['Dvr/GetRecordedList?Descending=true', 'Program','Programs'],
    videosourcelist     => ['Channel/VideoSourceList', 'VideoSource','VideoSources'],
    
    #add more like this => [url, separator for getDBinfo, separator for getDBheader],  
);

#--------------------------
# published routines follow
#--------------------------

sub ReadBackend($\$) {
 
    my ($url, $buff)=@_;
    unless ($browseropen){
        $browser = LWP::UserAgent->new;
        $browser->timeout(10);
        $browser->default_header('accept-Encoding' => 'gzip,deflate'); 
        $browseropen = 1;
    }
    my $response = $browser->get(tidyurl($url)); 
    unless($response->is_success){
        (defined wantarray()) || die $response->status_line;
        return 0;
    }
    $$buff = $response -> decoded_content;
    return 1;
}
#------------------------------
sub FillHashofHash(\%\$@){
    my ($hashref, $buff, $separator, $key_name, @params)=@_;
    %$hashref=();
    my $count=0;
    my $key;
    my $seek="(<$separator>|<$separator" . '\s+[^>]*?>)(.*?)</' . $separator . '>';
    while ($$buff =~ m!$seek!g){
		$key=$count;
		if ($key_name ne '#'){$key=myget($2, $key_name)};
		for my $item (@params){
			if ($item eq '#'){
				$$hashref{$key}{$item}=$count
			}else{
				$$hashref{$key}{$item}=myget($2,$item)
			}
		};
		$count++;	
	}
	return $count;
};

#-------------------------
sub GetAllFields(\%\$@){

    #   Read the buffer and populate a hash with all tags found between delimiting text.
    #   GetAllFields(%hash, $buffer, $start_text, $end_text)
    #       if $start_text or $end_text are empty strings, then start or end of buffer are assumed.
    #       eg
    #       ReadBackend('192.168.1.67:6544/Channel/GetChannelInfoList', $buffer)
    #       GetAllfields(%hash, $buffer, '', '<ChannelInfos>')
    #       print "$hash{'ProtoVer'}\n";
    #   rewritten 1 June 2022
    
    my ($hashref, $buff, $start_text,$end_text)=@_;
    
    $end_text ||='$';    #defaults
    $start_text ||='^';
    
    %$hashref=();
    my $counter=0;
    my $buff2;
    my $seek="$start_text(.*?)$end_text";
    $$buff =~ m!$seek!;
    $buff2=$1;
    unless (defined $buff2){die "Faulty start or end"};
    
    #Extract instances of  <key>something</key>
    while ($buff2 =~ m!<(\w*)>(.*?)</\1!g){
		$$hashref{$1}=&KillEscapes($2);
		$counter++;
	}
	
	#and of <key/> 
	while ($buff2 =~ m!<(\w*)/>!g){
		$$hashref{$1}='';
		$counter++;
	};
	
	#and <key xsi:nil="true"/>
	while ($buff2 =~ m!<(\w*)\s+xsi:nil\s*?=\s*?"true"/>!g){
		$$hashref{$1}='';
	}
	$counter;
}

#-----------------------------
sub APISupported($){
    #Check API against wsdl.
    #return 0=not known, 1=a GET, 2=a POST
    my ($APIurl)=@_;
    if ($APIurl =~ /\?/) {die "APISupported does not expect '?' in $APIurl"};
    my @URLbits = split '/', $APIurl;
    my $apicall=pop(@URLbits);
    my $service=$URLbits[-1];
    $apicall = $service . '/' . $apicall;
  
    #Do we know about this api service?  
    unless (defined $APICallingParameters{$service}){
        # Nope!  do a wsdl call        
        push  @URLbits, 'wsdl';
        my $url=join '/', @URLbits;
        my $content;
        ReadBackend($url,$content);
        #
        while ($content =~ m!<xs:element name="(\w*)">(.*?)</xs:complexType>!gs){
            (my $func, my $list)=($1, $2);
              
            unless ($func =~ /Response$/){
                @{$APICallingParameters{$service .'/' . $func}}=();  #In case no params found
                while ($list =~ m!name="(\w*)"!g){
                    push ( @{$APICallingParameters{$service .'/' . $func}}, $1);
                }
            }
        } 
        $APICallingParameters{$service}=1;  #to allow caching
        
        #now see if post or get: sample text is:
        #     <operation name="AddVideoSource"><documentation>POST </documentation>
        while ($content =~ /<operation name="([\w]*)">\s*<documentation>([\w]*)/g) {
			#  regex modified 12 May 2022:  was ...\s?  change needed for API backend on post 2744
            if ($2 eq 'POST') {
                $APItype{$service .'/' .$1}=2;
            }elsif ($2 eq 'GET'){
                $APItype{$service .'/' .$1}=1;
            }else{
                die "Not recognised operation type $2 for API $1 in APISupported"
            }
        }    
    }
    return $APItype{$apicall} || 0;
}
#----------------------
sub GetAPIParameters($){
    my ($p)=@_;
    unless (APISupported($p)){die "Unsupported API $p"};
    my @URLbits = split '/', $p;
    $p=$URLbits[-2] . '/' .$URLbits[-1];
    @{${APICallingParameters{$p}}};
}


#------------------------
sub ValidatePost(\%$$$){

    #Validate data for a POST before issuing it
    my ($hashref, $APIurl,$action, $SanityCount)=@_;

    unless ($APIurl =~ /^http:/) {$APIurl= 'http://' . $APIurl};
    unless ($action =~ /^post$|^test$|^raw$|^quiettest$/){
        die "ValidatePost actions are post, test, quiettest or raw.  $action not supported"
    };

    unless (&APISupported($APIurl)==2){
        if ($action !~ /quiettest/){print "$APIurl not supported or not a post on this backend"};
        if ($action =~ /test/){return 1};
        die '';
    }
     
    #split the url
    
    my @URLbits = split '/', $APIurl;
    my $apicall=pop(@URLbits);
    my $service=$URLbits[-1];
    $apicall = $service . '/' . $apicall;

    #ok, start by generating equivalent parameter names
    my %alias;my $k, my $v;
    while (($k, $v) = each %$hashref){
            $_=$k; 
            unless ($action =~ /raw/){$v=&InsertEscapes($v)};
            $alias{$_}=$v;
            $_=lc $_; $alias{$_}=$v;
            s/chan/channel/ unless (/channel/);
            s/freq/frequency/ unless (/frequency/);
            s/num$/number/;
            s/auth$/authority/;
            $alias{$_}=$v;
    }

    
   #now let us check against the wsdl output - build up a valid hash in %final
    my $missing=0;my %final;my $found=0;
    for (GetAPIParameters($APIurl)){    
        if (defined $alias{lc $_}){
            if ($action eq 'test'){print " $apicall found $_: Setting to: $alias{lc $_}\n"};
            $final{$_}=$alias{lc $_};
            $found++;
        }elsif (defined $alias{"#$_"}){
            #ok to omit this one - user declares it as optional.
            $found++;
        }else{
            print "** $apicall needs $_ **\n" unless  ($action eq 'quiettest');
            $missing++;
        }
    }
    if ($found<$SanityCount){
        #something has gone horribly wrong!
        $missing++; #to force exit
        unless ($action =~ /quiet/){
            print "Failed sanity check:  found $found params but expected at least $SanityCount\n";
        }
    }
    
    if ($action =~ /test/){return ($missing==0)?1:0};
    if ($missing){die "Unsafe to proceed with ValidatePost "};
    
    #Now post it!
    my $response = $browser -> post($APIurl,\%final);
    unless($response->is_success){die "Error updating recording"}; 
    my $url_buffer = $response -> content; 
    return $url_buffer;
}


#--------------
sub GetDBheader{
    #deprecated.
    #expects hash reference as first item; returns count of header items. 

    my ($hashref, $ip_addr, $class,$extra)=@_;
    $class=lc $class; 
    unless (defined ($steer{$class})) {die "Sorry - $class not supported"};
    $counter=0;
    #read from backend 
    my $url= &FormURL($ip_addr, $steer{$class}[0], $extra);
    my $buffer;
    ReadBackend($url, $buffer);
    return GetAllFields(%$hashref, $buffer,'',$steer{$class}[2]);
}
#---------------------

sub GetDBinfo{

my ($hashref, $ip_addr, $class, $extra, $key_name, @params)=@_;

    $class=lc $class; 
    unless (defined ($steer{$class})) {die "Sorry - $class not supported"};
 
    #read from backend 
    my $url= &FormURL($ip_addr, $steer{$class}[0], $extra);
    my $buffer;
    ReadBackend($url, $buffer);
    #process buffer
    FillHashofHash(%$hashref, $buffer, $steer{$class}[1], $key_name, @params);
}


#-------------------------
#internal routines follow
#-------------------------

sub myget{
	my ($content, $tag)= @_;
	
	my $seek="(<$tag>|<$tag" . '\s[^>]*?>)(.*?)</' . $tag . '>';
	if ($content =~ m!$seek!){return $2};
	
	$seek="<$tag\\s?/>";
	if ($content =~ m!$seek!){return ''};
	
	$seek="<$tag" . '\s(.*?)/>';
	if ($content =~ m!$seek!){
		my $temp=$1;
		$seek='xsi:nil="true"';
		if ($temp =~ m!$seek!){return ''};   #eg <Value xsi:nil="true"/>
		return $temp;
	}
	
	return '';  #or your preferred action on missing tag.  
		            #Beware: Port 6744 omits many null values and v33 will probably do so too. 
}

sub tidyurl{
    my ($url)=@_;
    $url='http://'. $url unless ($url =~ m!^http://!);
    $url;
}


sub FormURL{
    #used in 
    my ($ip, $class, $extra)=@_;
    my $addr="http://$ip:6544/$class";
    if ($extra){
        if ($addr =~ /\?/){
            $addr .= '&' . $extra;
        }else{
            $addr .= '?' . $extra;
        }
    }
    return $addr;
}


sub KillEscapes{
    my ($data)=@_;
    return $data unless ($data =~ /&\w+;/);
    my $a=';';    #trick to prevent wiki from corrupting this code 
    $data =~ s/&quot$a/"/g; 
    $data =~ s/&lt$a/</g; 
    $data =~ s/&gt$a/>/g; 
    $data =~ s/&apos$a/'/g; 
    $data =~ s/&amp$a/&/g; 
    $data;
}

sub InsertEscapes{
    my ($data)= @_;
    my $a=';';
    $data =~ s/&/&amp$a/g; 
    $data =~ s/"/&quot$a/g; 
    $data =~ s/</&lt$a/g; 
    $data =~ s/>/&gt$a/g; 
    $data =~ s/'/&apos$a/g; 
    $data;
}
1;
