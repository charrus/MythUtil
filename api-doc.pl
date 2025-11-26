#!/usr/bin/perl -w
use strict;
use lib '.';
use scan_database;    #See https://www.mythtv.org/wiki/Perl_API_examples
use Getopt::Long;
#
#scan all wsdl pages; extract API calls, whether post or get, and the parameters.
#print in a form suitable for populating a perl hash.
#

my %status;
my $newversion;
my %newdata;

my $oldversion;
my %olddata;

my $frontend; my $backend; my $help, my $baseline; my $generatebase;my $current;
GetOptions("frontend:s"   => \$frontend,
           "backend:s"    => \$backend,
           "help"         => \$help,
           "givebaseline" => \$generatebase,
           "baseline:s"   => \$baseline,
           "current:s"    => \$current,
           );


if ($help){&help};

if ($current){
    &SetBase($current);         #grabs new data and puts it initially in 'old'
    $newversion=$oldversion;    #Now put it in 'new'
    $oldversion= '';    #was '0.23.4' ??
    %newdata=%olddata;
    %olddata=();
}else{
    &ExtractFromServer;
}

if ($generatebase){&writebaseline; exit};
if ($baseline) {
    &SetBase($baseline); 
    &compare;
    &ShowNew(1);        #print comparison wiki
}else{
    &ShowNew(0);
}    
exit 0;


sub SetBase{
    (my $base)=@_;
    #read baseline data from file or from preset data at end of program
    %olddata=();
    if ($base =~ /^0\.27$/){
        &grab(\&data027);
    }elsif ($base =~ /^0\.28$/){
        &grab(\&data027);
        &grab(\&data028);
    }elsif ($base =~ /^29$/){
        &grab(\&data027);
        &grab(\&data028);
        &grab(\&data29);
    }else{
        #read params from file - populate %olddata
        (my $f)=glob($base);
        open FH, '<', $f or die "cannot open $f\n";
        while (<FH>){
            chomp;
            &process($_);
        }
    }
}

sub process{
    (my $line)=@_;
    if ($line =~ /Version=(.*)/){
		$oldversion=$1;
        return;
     };
    (my $k, my $v)=split ':',$line;
    $olddata{$k}=$v;
}

sub grab{
    #get pre-set data
    (my $ref)=@_;
    ($oldversion, my $temp)=&$ref();
    my $line; my $k, my $v; my $wholeline;
    # $wholeline accumulates split lines
    for $line (split /^/,$temp){
        chomp $line;
        if ($line =~ /:/){
            if ($wholeline =~ /:/){
                ($k, $v)= split /:/, $wholeline;
                $olddata{$k}=$v;
            }
            $wholeline=$line;
        }else{ 
            $wholeline .= ' ' . $line;
        }
    }
    if ($wholeline =~ /:/){
        ($k, $v)= split /:/, $wholeline;
        $olddata{$k}=$v;
    }

}


sub writebaseline{
    print "Version=$newversion\n";
    for (sort keys %newdata){
        #temporary development aid - only generate changes in 0.28
        #(defined $olddata{$_}) && ($newdata{$_} eq $olddata{$_}) && next;
        print "$_:$newdata{$_}\n";
    }
}

sub ShowNew{
    (my $compare)=@_;
    print "\n\n==API routines in $newversion==\n";
    if ($compare){print "Comparisons are with $oldversion\n"};
    my $i;my $lastservice='';my $newservice;
    for $i (sort keys %newdata){
           ($newservice)=split '/', $i;
           if ($newservice ne $lastservice){print "====$newservice  service====\n"; $lastservice=$newservice;};
           &Detail($i, $newdata{$i}, $compare);
    }
    #now finish off page
    print "[[Category:Services_API]]\n";
    print "[[Category:Developer_Documentation]]\n";
}


sub Detail{
    (my $k, my $v, my $comp)=@_;
  
    (my $service, my $api,)=split '/', $k;
    
    my $serviceurl=$service;
    if ($service eq 'Dvr'){$serviceurl="DVR"};

    my @temp=split /\s+/, $v;
    my $type=shift @temp;
    if ($type =~ /get/i){ $type .=' '};
    my $out= "  [[${serviceurl}_Service#$api|$service/$api]]" . ' ' x (35-length($k)) . "type: " . $type;
    if ($comp){$out .= "    Status: $status{$k}"};
    print "$out\n  \n";

    #now print params
    $out='  Params: ';
    my $tmp;
    if (scalar @temp){
        #put a comma on each parameter except the last
        for (0 .. $#temp-1){
            $temp[$_] .=', ';
        }
        my $more=0;
        while ($tmp= shift @temp){
            $out .= $tmp;
            $more++;
            if (length($out) >70){
                print "$out\n";
                $out='          ';
                $more=0;
            } 
        }
        if ($more){print "$out\n"};
        print "\n"; 
    }else{
        print "    Params:  (none)\n\n"
    }
}

sub shortversion{
	#generate eg 0.27 or 32 from version number
	(my $longversion)=@_;
	if ($longversion =~ /(^0.2\d)/){
		return $1;
	}else{
		$longversion =~ /(^\d\d)/;
		return $1;
	}
	
}

sub compare{
	my $oldshort=shortversion($oldversion);
	my $type;
    if (shortversion($newversion) lt $oldshort){
        print "Warning: New version is older than base version!\n";
        print "  Press return to continue:\n"; <>;};
    for (sort keys %newdata){       
        if (!defined $olddata{$_}){
            $status{$_}="new since $oldshort";
        }elsif ($olddata{$_} eq $newdata{$_}){
            $status{$_}="same as $oldshort";
        }else{
            $status{$_}="changed since $oldshort";
        }
    }

    for (sort keys %olddata){       
        if (!defined $newdata{$_}){
            ($type)=split ' ', $olddata{$_};
            $newdata{$_}= "$type (omitted)";
            $status{$_}="REMOVED since $oldshort";
        }
    }
}




sub ExtractFromServer{
    unless ($backend){
        #look for a config file
        my @dirs = qw (~/.mythtv/config.xml  /home/mythtv/.mythtv/config.xml /etc/mythtv/config.xml);
        if ($ENV{'MYTHCONFDIR'}){unshift @dirs, $ENV{'MYTHCONFDIR'}};
        for my $file (@dirs){
            (my $fn)=glob($file);
            if ((defined $fn) && (-e $fn)){
                open CONFIG, "$fn" or die "Cannot open $fn $!";
                while ($_ = <CONFIG>){
                    if (m!<Host>(\S+)</Host>!) {$backend=$1;};
                }
                close CONFIG;
                last;
            }
        }
    }
    unless ($backend){$backend='127.0.0.1'};
    unless ($backend =~ /:/){ $backend .= ':6544'};

    unless ($frontend){
        ($frontend)= split ':', $backend;
    }
    unless ($frontend =~ /:/){$frontend .= ':6547'};

    #get version
    my $temp;
    unless (ReadBackend($backend.'/Channel/GetVideoSourceList', $temp)){
            die "Cannot contact backend at $backend"};

    $temp =~ m!<Version>([^<]*)</Version>!;
    $newversion=$1;

    unless (ReadBackend($frontend . '/Frontend/GetStatus',$temp)){
            die "Cannot contact frontend at $frontend"};


    #now populate the caches in the module

    my $reply=APISupported("${frontend}/Frontend/junk");
    #now backend calls
    for my $service (qw/Capture Channel Content Dvr Guide Myth Video/){
        $reply=APISupported("${backend}/${service}/junk");
        #they will all fail but still cache the data
    }

    #now populate %newdata
    
    %newdata=();
    my %params=%scan_database::APICallingParameters;
    my %types=%scan_database::APItype;
    my @list;
    for (sort keys %types){
        my $typetext= ('??? ', 'GET', 'POST')[$types{$_}];
	if(defined $params{$_}) {
	    @list=sort @{$params{$_}};
	    unshift @list, $typetext;
	    $newdata{$_}=join ' ', @list;;
	}
    }
}

sub help{
print <<ENDHELP;



AUTOWIKI
--------
autowiki.pl automates the production of Wiki pages for MythTV Services API
endpoints (calls).

It reads all WSDL pages from a frontend and backend and generates a list of
the API calls, whether GET or POST, and their calling parameters.  If 
--baseline is specified then it will also highlight changes from that base.

Output is in a form suitable for placing directly in a Wiki page with
minimal manual editing.  See https://www.mythtv.org/wiki/API_parameters_0.28
for an example of output from this script.

Calling Parameters (all optional):
----------------------------------
    --backend       Backend hostname/IP address and (optionally) port no.
    --frontend      Frontend hostname/IP address and (optionally) port no.
    --help          This text!
    --baseline      Can be set to 0.27, 0.28 or 29 to use preset data embedded 
                    in this code or the name of a file holding the baseline 
                    information.
    --current       as --baseline but used for 'current' settings. If omitted
                    then hosts are accessed for wsdl information.
                    Primarily a development aid.
    --givebaseline  Outputs a baseline for the servers analysed.

     If --backend is omitted, the script searches for a host in config.xml
     located in directories : environment variable MYTHCONFDIR, ~/.mythtv/, 
     /home/mythtv/.mythtv/ and finally /etc/mythtv/.
     Failing that, it assumes 127.0.0.1.

     If --frontend is omitted then a combined FE/BE system is assumed and the
     backend address is used.

     Port numbers default to 6544 for backend and 6547 for frontend.

Output
------
    All output is to the screen.

Examples
--------
    ./autowiki.pl > listing    generates wiki text from host(s) found.
    ./autowiki.pl --back 192.168.1.1 --front 192.168.1.2 > listing     Ditto
    ./autowiki.pl --base 0.27>listing
                            ditto but highlights changes since 0.27
    ./autowiki.pl --givebaseline>listing   
                  generates a base from host for use in a later comparison.
    ./autowiki.pl --current 29 --base 0.28      used to generate 29 wiki page!
ENDHELP
exit 0;
}

sub data027{
#returns (version, data)
('0.27.20141016-1', '
Capture/AddCaptureCard:POST AudioDevice AudioRateLimit Brightness
CardType ChannelTimeout Colour Contrast DVBDiSEqCType DVBEITScan
DVBOnDemand DVBSWFilter DVBSatType DVBTuningDelay DVBWaitForSeqStart
DiSEqCId FirewireConnection FirewireModel FirewireSpeed HostName
Hue SignalTimeout SkipBTAudio VBIDevice VideoDevice
Capture/AddCardInput:POST CardId ChangerDevice ChangerModel
DishnetEIT DisplayName ExternalCommand HostName InputName
LiveTVOrder Quicktune RecPriority SchedOrder SourceId StartChan TuneChan
Capture/GetCaptureCard:GET CardId
Capture/GetCaptureCardList:GET CardType HostName
Capture/RemoveCaptureCard:POST CardId
Capture/RemoveCardInput:POST CardInputId
Capture/UpdateCaptureCard:POST CardId Setting Value
Capture/UpdateCardInput:POST CardInputId Setting Value
Channel/AddDBChannel:POST ATSCMajorChannel ATSCMinorChannel CallSign
ChannelID ChannelName ChannelNumber DefaultAuthority Format
FrequencyID Icon MplexID ServiceID SourceID UseEIT XMLTVID visible
Channel/AddVideoSource:POST ConfigPath FreqTable Grabber LineupId
NITId Password SourceName UseEIT UserId
Channel/FetchChannelsFromSource:GET CardId SourceId WaitForFinish
Channel/GetChannelInfo:GET ChanID
Channel/GetChannelInfoList:GET Count SourceID StartIndex
Channel/GetDDLineupList:GET Password Source UserId
Channel/GetVideoMultiplex:GET MplexID
Channel/GetVideoMultiplexList:GET Count SourceID StartIndex
Channel/GetVideoSource:GET SourceID
Channel/GetVideoSourceList:GET
Channel/GetXMLTVIdList:GET SourceID
Channel/RemoveDBChannel:POST ChannelID
Channel/RemoveVideoSource:POST SourceID
Channel/UpdateDBChannel:POST ATSCMajorChannel ATSCMinorChannel
CallSign ChannelID ChannelName ChannelNumber DefaultAuthority
Format FrequencyID Icon MplexID ServiceID SourceID UseEIT XMLTVID
visible
Channel/UpdateVideoSource:POST ConfigPath FreqTable Grabber
LineupId NITId Password SourceID SourceName UseEIT UserId
Content/AddLiveStream:GET AudioBitrate Bitrate FileName
Height HostName MaxSegments SampleRate StorageGroup Width
Content/AddRecordingLiveStream:GET AudioBitrate Bitrate
ChanId Height MaxSegments SampleRate StartTime Width
Content/AddVideoLiveStream:GET AudioBitrate Bitrate
Height Id MaxSegments SampleRate Width
Content/DownloadFile:POST StorageGroup URL
Content/GetAlbumArt:GET Height Id Width
Content/GetFile:GET FileName StorageGroup
Content/GetFileList:GET StorageGroup
Content/GetHash:GET FileName StorageGroup
Content/GetImageFile:GET FileName Height StorageGroup Width
Content/GetLiveStream:GET Id
Content/GetLiveStreamList:GET FileName
Content/GetMusic:GET Id
Content/GetPreviewImage:GET ChanId Height SecsIn StartTime Width
Content/GetProgramArtworkList:GET Inetref Season
Content/GetRecording:GET ChanId StartTime
Content/GetRecordingArtwork:GET Height Inetref Season Type Width
Content/GetRecordingArtworkList:GET ChanId StartTime
Content/GetVideo:GET Id
Content/GetVideoArtwork:GET Height Id Type Width
Content/RemoveLiveStream:GET Id
Content/StopLiveStream:GET Id
Dvr/AddRecordSchedule:POST AutoCommflag AutoExpire AutoMetaLookup
AutoTranscode AutoUserJob1 AutoUserJob2 AutoUserJob3 AutoUserJob4
Category ChanId Description DupIn DupMethod EndOffset EndTime
Episode Filter FindDay FindTime Inactive Inetref MaxEpisodes
MaxNewest ParentId PlayGroup PreferredInput ProgramId RecGroup
RecPriority RecProfile SearchType Season SeriesId StartOffset
StartTime Station StorageGroup Subtitle Title Transcoder Type
Dvr/DisableRecordSchedule:POST RecordId
Dvr/EnableRecordSchedule:POST RecordId
Dvr/GetConflictList:GET Count StartIndex
Dvr/GetEncoderList:GET
Dvr/GetExpiringList:GET Count StartIndex
Dvr/GetRecGroupList:GET
Dvr/GetRecordSchedule:GET ChanId MakeOverride RecordId StartTime Template
Dvr/GetRecordScheduleList:GET Count StartIndex
Dvr/GetRecorded:GET ChanId StartTime
Dvr/GetRecordedList:GET Count Descending RecGroup StartIndex
StorageGroup TitleRegEx
Dvr/GetTitleInfoList:GET
Dvr/GetTitleList:GET
Dvr/GetUpcomingList:GET Count ShowAll StartIndex
Dvr/RemoveRecordSchedule:POST RecordId
Dvr/RemoveRecorded:GET ChanId StartTime
Dvr/UpdateRecordSchedule:POST AutoCommflag AutoExpire AutoMetaLookup
AutoTranscode AutoUserJob1 AutoUserJob2 AutoUserJob3 AutoUserJob4
Category ChanId Description DupIn DupMethod EndOffset EndTime
Episode Filter FindDay FindTime Inactive Inetref MaxEpisodes
MaxNewest PlayGroup PreferredInput ProgramId RecGroup RecPriority
RecProfile RecordId SearchType Season SeriesId StartOffset
StartTime Station StorageGroup Subtitle Title Transcoder Type
Frontend/GetActionList:GET Context
Frontend/GetContextList:GET
Frontend/GetStatus:GET
Frontend/PlayRecording:GET ChanId StartTime
Frontend/PlayVideo:GET Id UseBookmark
Frontend/SendAction:GET Action Height Value Width
Frontend/SendMessage:GET Message Timeout
Frontend/SendNotification:GET Description Error Extra Fullscreen
Image Message Origin Priority Progress ProgressText Timeout Type Visibility
Guide/GetChannelIcon:GET ChanId Height Width
Guide/GetProgramDetails:GET ChanId StartTime
Guide/GetProgramGuide:GET Details EndTime NumChannels StartChanId StartTime
Myth/AddStorageGroupDir:POST DirName GroupName HostName
Myth/BackupDatabase:POST
Myth/ChangePassword:POST NewPassword OldPassword UserName
Myth/CheckDatabase:POST Repair
Myth/GetConnectionInfo:GET Pin
Myth/GetHostName:GET
Myth/GetHosts:GET
Myth/GetKeys:GET
Myth/GetLogs:GET Application Filename FromTime Function
HostName Level Line MsgContains PID TID Thread ToTime
Myth/GetSetting:GET Default HostName Key
Myth/GetStorageGroupDirs:GET GroupName HostName
Myth/GetTimeZone:GET
Myth/ProfileDelete:POST
Myth/ProfileSubmit:POST
Myth/ProfileText:GET
Myth/ProfileURL:GET
Myth/ProfileUpdated:GET
Myth/PutSetting:POST HostName Key Value
Myth/RemoveStorageGroupDir:POST DirName GroupName HostName
Myth/SendMessage:GET Address Message Timeout udpPort
Myth/SendNotification:GET Address Description Error Extra Fullscreen
Image Message Origin Priority Progress ProgressText Timeout Type 
Visibility udpPort
Myth/TestDBSettings:POST DBName HostName Password UserName dbPort
Video/AddVideo:POST FileName HostName
Video/GetBluray:GET Path
Video/GetVideo:GET Id
Video/GetVideoByFileName:GET FileName
Video/GetVideoList:GET Count Descending StartIndex
Video/LookupVideo:GET AllowGeneric Episode GrabberType Inetref Season
Subtitle Title
Video/RemoveVideoFromDB:POST Id
');
}

sub data028{
#returns (version, data)

('0.28.20150906-1', '
Channel/AddDBChannel:POST ATSCMajorChannel ATSCMinorChannel
CallSign ChannelID ChannelName ChannelNumber DefaultAuthority
Format FrequencyID Icon MplexID ServiceID SourceID UseEIT
Visible XMLTVID
Channel/GetChannelInfoList:GET Count Details OnlyVisible
SourceID StartIndex
Channel/UpdateDBChannel:POST ATSCMajorChannel ATSCMinorChannel
CallSign ChannelID ChannelName ChannelNumber DefaultAuthority
Format FrequencyID Icon MplexID ServiceID SourceID UseEIT
Visible XMLTVID
Content/AddRecordingLiveStream:GET AudioBitrate Bitrate
ChanId Height MaxSegments RecordedId SampleRate StartTime Width
Content/GetDirList:GET StorageGroup
Content/GetPreviewImage:GET ChanId Format Height RecordedId
SecsIn StartTime Width
Content/GetRecording:GET ChanId RecordedId StartTime
Content/GetRecordingArtworkList:GET ChanId RecordedId StartTime
Dvr/AddDontRecordSchedule:GET ChanId NeverRecord StartTime
Dvr/DeleteRecording:POST AllowRerecord ChanId ForceDelete
RecordedId StartTime
Dvr/DupInToDescription:GET DupIn
Dvr/DupInToString:GET DupIn
Dvr/DupMethodToDescription:GET DupMethod
Dvr/DupMethodToString:GET DupMethod
Dvr/GetConflictList:GET Count RecordId StartIndex
Dvr/GetInputList:GET
Dvr/GetPlayGroupList:GET
Dvr/GetRecRuleFilterList:GET
Dvr/GetRecStorageGroupList:GET
Dvr/GetRecordSchedule:GET ChanId MakeOverride RecordId
RecordedId StartTime Template
Dvr/GetRecordScheduleList:GET Count Descending Sort StartIndex
Dvr/GetRecorded:GET ChanId RecordedId StartTime
Dvr/GetRecordedCommBreak:GET ChanId OffsetType RecordedId StartTime
Dvr/GetRecordedCutList:GET ChanId OffsetType RecordedId StartTime
Dvr/GetTitleList:GET RecGroup
Dvr/GetUpcomingList:GET Count RecStatus RecordId ShowAll StartIndex
Dvr/RecStatusToDescription:GET RecStatus RecType StartTime
Dvr/RecStatusToString:GET RecStatus
Dvr/RecTypeToDescription:GET RecType
Dvr/RecTypeToString:GET RecType
Dvr/RemoveRecorded:POST AllowRerecord ChanId ForceDelete RecordedId StartTime
Dvr/UnDeleteRecording:GET ChanId RecordedId StartTime
Dvr/UpdateRecordedWatchedStatus:POST ChanId RecordedId StartTime Watched
Frontend/PlayRecording:POST ChanId RecordedId StartTime
Frontend/PlayVideo:POST Id UseBookmark
Frontend/SendAction:POST Action Height Value Width
Frontend/SendMessage:POST Message Timeout
Frontend/SendNotification:POST Description Error Extra Fullscreen Image
Message Origin Priority Progress ProgressText Timeout Type Visibility
Guide/GetCategoryList:GET
Guide/GetChannelGroupList:GET IncludeEmpty
Guide/GetProgramGuide:GET ChannelGroupId Count Details EndTime
StartIndex StartTime
Guide/GetProgramList:GET CategoryFilter ChanId Count Descending
Details EndTime KeywordFilter OnlyNew PersonFilter Sort
StartIndex StartTime TitleFilter
Guide/GetStoredSearches:GET Type
Myth/GetFormatDate:GET Date ShortDate
Myth/GetFormatDateTime:GET DateTime ShortDate
Myth/GetFormatTime:GET Time
Myth/GetFrontends:GET OnLine
Myth/GetSettingList:GET HostName
Myth/ParseISODateString:GET DateTime
Myth/SendMessage:POST Address Message Timeout udpPort
Myth/SendNotification:POST Address Description Error
Extra Fullscreen Image Message Origin Priority Progress
ProgressText Timeout Type Visibility udpPort
Video/GetVideoList:GET Count Descending Folder Sort StartIndex
Video/UpdateVideoWatchedStatus:POST Id Watched
');
}

sub data29{
#returns (version, data)

('29.20170212-1', '
Capture/AddCaptureCard:POST AudioDevice AudioRateLimit Brightness CardType ChannelTimeout Colour Contrast DVBDiSEqCType DVBEITScan DVBOnDemand DVBSWFilter DVBSatType DVBTuningDelay DVBWaitForSeqStart DiSEqCId FirewireConnection FirewireModel FirewireSpeed HostName Hue SignalTimeout SkipBTAudio VBIDevice VideoDevice
Capture/AddCardInput:POST CardId ChangerDevice ChangerModel DishnetEIT DisplayName ExternalCommand HostName InputName LiveTVOrder Quicktune RecPriority SchedOrder SourceId StartChan TuneChan
Capture/GetCaptureCard:GET CardId
Capture/GetCaptureCardList:GET CardType HostName
Capture/RemoveCaptureCard:POST CardId
Capture/RemoveCardInput:POST CardInputId
Capture/UpdateCaptureCard:POST CardId Setting Value
Capture/UpdateCardInput:POST CardInputId Setting Value
Channel/AddDBChannel:POST ATSCMajorChannel ATSCMinorChannel CallSign ChannelID ChannelName ChannelNumber DefaultAuthority Format FrequencyID Icon MplexID ServiceID SourceID UseEIT Visible XMLTVID
Channel/AddVideoSource:POST ConfigPath FreqTable Grabber LineupId NITId Password SourceName UseEIT UserId
Channel/FetchChannelsFromSource:GET CardId SourceId WaitForFinish
Channel/GetChannelInfo:GET ChanID
Channel/GetChannelInfoList:GET Count Details OnlyVisible SourceID StartIndex
Channel/GetDDLineupList:GET Password Source UserId
Channel/GetVideoMultiplex:GET MplexID
Channel/GetVideoMultiplexList:GET Count SourceID StartIndex
Channel/GetVideoSource:GET SourceID
Channel/GetVideoSourceList:GET
Channel/GetXMLTVIdList:GET SourceID
Channel/RemoveDBChannel:POST ChannelID
Channel/RemoveVideoSource:POST SourceID
Channel/UpdateDBChannel:POST ATSCMajorChannel ATSCMinorChannel CallSign ChannelID ChannelName ChannelNumber DefaultAuthority Format FrequencyID Icon MplexID ServiceID SourceID UseEIT Visible XMLTVID
Channel/UpdateVideoSource:POST ConfigPath FreqTable Grabber LineupId NITId Password SourceID SourceName UseEIT UserId
Content/AddLiveStream:GET AudioBitrate Bitrate FileName Height HostName MaxSegments SampleRate StorageGroup Width
Content/AddRecordingLiveStream:GET AudioBitrate Bitrate ChanId Height MaxSegments RecordedId SampleRate StartTime Width
Content/AddVideoLiveStream:GET AudioBitrate Bitrate Height Id MaxSegments SampleRate Width
Content/DownloadFile:POST StorageGroup URL
Content/GetAlbumArt:GET Height Id Width
Content/GetDirList:GET StorageGroup
Content/GetFile:GET FileName StorageGroup
Content/GetFileList:GET StorageGroup
Content/GetHash:GET FileName StorageGroup
Content/GetImageFile:GET FileName Height StorageGroup Width
Content/GetLiveStream:GET Id
Content/GetLiveStreamList:GET FileName
Content/GetMusic:GET Id
Content/GetPreviewImage:GET ChanId Format Height RecordedId SecsIn StartTime Width
Content/GetProgramArtworkList:GET Inetref Season
Content/GetRecording:GET ChanId RecordedId StartTime
Content/GetRecordingArtwork:GET Height Inetref Season Type Width
Content/GetRecordingArtworkList:GET ChanId RecordedId StartTime
Content/GetVideo:GET Id
Content/GetVideoArtwork:GET Height Id Type Width
Content/RemoveLiveStream:GET Id
Content/StopLiveStream:GET Id
Dvr/AddDontRecordSchedule:GET ChanId NeverRecord StartTime
Dvr/AddRecordSchedule:POST AutoCommflag AutoExpire AutoMetaLookup AutoTranscode AutoUserJob1 AutoUserJob2 AutoUserJob3 AutoUserJob4 Category ChanId Description DupIn DupMethod EndOffset EndTime Episode Filter FindDay FindTime Inactive Inetref MaxEpisodes MaxNewest ParentId PlayGroup PreferredInput ProgramId RecGroup RecPriority RecProfile SearchType Season SeriesId StartOffset StartTime Station StorageGroup Subtitle Title Transcoder Type
Dvr/DeleteRecording:POST AllowRerecord ChanId ForceDelete RecordedId StartTime
Dvr/DisableRecordSchedule:POST RecordId
Dvr/DupInToDescription:GET DupIn
Dvr/DupInToString:GET DupIn
Dvr/DupMethodToDescription:GET DupMethod
Dvr/DupMethodToString:GET DupMethod
Dvr/EnableRecordSchedule:POST RecordId
Dvr/GetConflictList:GET Count RecordId StartIndex
Dvr/GetEncoderList:GET
Dvr/GetExpiringList:GET Count StartIndex
Dvr/GetInputList:GET
Dvr/GetOldRecordedList:GET Count Descending EndTime RecordId SeriesId Sort StartIndex StartTime Title
Dvr/GetPlayGroupList:GET
Dvr/GetRecGroupList:GET
Dvr/GetRecRuleFilterList:GET
Dvr/GetRecStorageGroupList:GET
Dvr/GetRecordSchedule:GET ChanId MakeOverride RecordId RecordedId StartTime Template
Dvr/GetRecordScheduleList:GET Count Descending Sort StartIndex
Dvr/GetRecorded:GET ChanId RecordedId StartTime
Dvr/GetRecordedCommBreak:GET ChanId OffsetType RecordedId StartTime
Dvr/GetRecordedCutList:GET ChanId OffsetType RecordedId StartTime
Dvr/GetRecordedList:GET Count Descending RecGroup StartIndex StorageGroup TitleRegEx
Dvr/GetRecordedSeek:GET OffsetType RecordedId
Dvr/GetSavedBookmark:GET ChanId OffsetType RecordedId StartTime
Dvr/GetTitleInfoList:GET
Dvr/GetTitleList:GET RecGroup
Dvr/GetUpcomingList:GET Count RecStatus RecordId ShowAll StartIndex
Dvr/ReactivateRecording:GET RecordedId
Dvr/RecStatusToDescription:GET RecStatus RecType StartTime
Dvr/RecStatusToString:GET RecStatus
Dvr/RecTypeToDescription:GET RecType
Dvr/RecTypeToString:GET RecType
Dvr/RecordedIdForPathname:GET Pathname
Dvr/RemoveRecordSchedule:POST RecordId
Dvr/RemoveRecorded:POST AllowRerecord ChanId ForceDelete RecordedId StartTime
Dvr/RescheduleRecordings:GET
Dvr/SetSavedBookmark:POST ChanId Offset OffsetType RecordedId StartTime
Dvr/StopRecording:GET RecordedId
Dvr/UnDeleteRecording:GET ChanId RecordedId StartTime
Dvr/UpdateRecordSchedule:POST AutoCommflag AutoExpire AutoMetaLookup AutoTranscode AutoUserJob1 AutoUserJob2 AutoUserJob3 AutoUserJob4 Category ChanId Description DupIn DupMethod EndOffset EndTime Episode Filter FindDay FindTime Inactive Inetref MaxEpisodes MaxNewest PlayGroup PreferredInput ProgramId RecGroup RecPriority RecProfile RecordId SearchType Season SeriesId StartOffset StartTime Station StorageGroup Subtitle Title Transcoder Type
Dvr/UpdateRecordedWatchedStatus:POST ChanId RecordedId StartTime Watched
Frontend/GetActionList:GET Context
Frontend/GetContextList:GET
Frontend/GetStatus:GET
Frontend/PlayRecording:POST ChanId RecordedId StartTime
Frontend/PlayVideo:POST Id UseBookmark
Frontend/SendAction:POST Action Height Value Width
Frontend/SendKey:POST Key
Frontend/SendMessage:POST Message Timeout
Frontend/SendNotification:POST Description Error Extra Fullscreen Image Message Origin Priority Progress ProgressText Timeout Type Visibility
Guide/AddToChannelGroup:GET ChanId ChannelGroupId
Guide/GetCategoryList:GET
Guide/GetChannelGroupList:GET IncludeEmpty
Guide/GetChannelIcon:GET ChanId Height Width
Guide/GetProgramDetails:GET ChanId StartTime
Guide/GetProgramGuide:GET ChannelGroupId Count Details EndTime StartIndex StartTime
Guide/GetProgramList:GET CategoryFilter ChanId Count Descending Details EndTime KeywordFilter OnlyNew PersonFilter Sort StartIndex StartTime TitleFilter
Guide/GetStoredSearches:GET Type
Guide/RemoveFromChannelGroup:GET ChanId ChannelGroupId
Myth/AddStorageGroupDir:POST DirName GroupName HostName
Myth/BackupDatabase:POST
Myth/ChangePassword:POST NewPassword OldPassword UserName
Myth/CheckDatabase:POST Repair
Myth/GetBackendInfo:GET
Myth/GetConnectionInfo:GET Pin
Myth/GetFormatDate:GET Date ShortDate
Myth/GetFormatDateTime:GET DateTime ShortDate
Myth/GetFormatTime:GET Time
Myth/GetFrontends:GET OnLine
Myth/GetHostName:GET
Myth/GetHosts:GET
Myth/GetKeys:GET
Myth/GetLogs:GET Application Filename FromTime Function HostName Level Line MsgContains PID TID Thread ToTime
Myth/GetSetting:GET Default HostName Key
Myth/GetSettingList:GET HostName
Myth/GetStorageGroupDirs:GET GroupName HostName
Myth/GetTimeZone:GET
Myth/ParseISODateString:GET DateTime
Myth/ProfileDelete:POST
Myth/ProfileSubmit:POST
Myth/ProfileText:GET
Myth/ProfileURL:GET
Myth/ProfileUpdated:GET
Myth/PutSetting:POST HostName Key Value
Myth/RemoveStorageGroupDir:POST DirName GroupName HostName
Myth/SendMessage:POST Address Message Timeout udpPort
Myth/SendNotification:POST Address Description Error Extra Fullscreen Image Message Origin Priority Progress ProgressText Timeout Type Visibility udpPort
Myth/TestDBSettings:POST DBName HostName Password UserName dbPort
Video/AddVideo:POST FileName HostName
Video/GetBluray:GET Path
Video/GetVideo:GET Id
Video/GetVideoByFileName:GET FileName
Video/GetVideoList:GET Count Descending Folder Sort StartIndex
Video/LookupVideo:GET AllowGeneric Episode GrabberType Inetref Season Subtitle Title
Video/RemoveVideoFromDB:POST Id
Video/UpdateVideoMetadata:POST Banner Browse Cast Category ChildID CollectionRef ContentType Countries CoverFile Director Episode Fanart FileName Genres Hash HomePage Host Id Inetref InsertDate Length PlayCommand PlayCount Plot Processed Rating ReleaseDate Screenshot Season ShowLevel Studio SubTitle TagLine Title Trailer UserRating Watched Year
Video/UpdateVideoWatchedStatus:POST Id Watched
');
}
