

==API routines in 34.20220913-1==
====Capture  service====
  [[Capture_Service#AddCaptureCard|Capture/AddCaptureCard]]             type: POST
  
  Params: AudioDevice, AudioRateLimit, Brightness, CardType, ChannelTimeout, 
          Colour, Contrast, DVBDiSEqCType, DVBEITScan, DVBOnDemand, DVBSWFilter, 
          DVBSatType, DVBTuningDelay, DVBWaitForSeqStart, DiSEqCId, FirewireConnection, 
          FirewireModel, FirewireSpeed, HostName, Hue, SignalTimeout, SkipBTAudio, 
          VBIDevice, VideoDevice

  [[Capture_Service#AddCardInput|Capture/AddCardInput]]               type: POST
  
  Params: CardId, ChangerDevice, ChangerModel, DishnetEIT, DisplayName, 
          ExternalCommand, HostName, InputName, LiveTVOrder, Quicktune, 
          RecPriority, SchedOrder, SourceId, StartChan, TuneChan

  [[Capture_Service#AddDiseqcConfig|Capture/AddDiseqcConfig]]            type: POST
  
  Params: CardId, DiSEqCId, Value

  [[Capture_Service#AddDiseqcTree|Capture/AddDiseqcTree]]              type: POST
  
  Params: Address, CmdRepeat, Description, LnbLofHi, LnbLofLo, LnbLofSwitch, 
          LnbPolInv, Ordinal, ParentId, RotorHiSpeed, RotorLoSpeed, RotorPositions, 
          ScrFrequency, ScrPin, ScrUserband, SubType, SwitchPorts, Type

  [[Capture_Service#AddRecProfile|Capture/AddRecProfile]]              type: POST
  
  Params: AudioCodec, GroupId, ProfileName, VideoCodec

  [[Capture_Service#AddUserInputGroup|Capture/AddUserInputGroup]]          type: POST
  
  Params: Name

  [[Capture_Service#DeleteRecProfile|Capture/DeleteRecProfile]]           type: POST
  
  Params: ProfileId

  [[Capture_Service#GetCaptureCard|Capture/GetCaptureCard]]             type: GET 
  
  Params: CardId

  [[Capture_Service#GetCaptureCardList|Capture/GetCaptureCardList]]         type: GET 
  
  Params: CardType, HostName

  [[Capture_Service#GetCaptureDeviceList|Capture/GetCaptureDeviceList]]       type: GET 
  
  Params: CardType

  [[Capture_Service#GetCardSubType|Capture/GetCardSubType]]             type: GET 
  
  Params: CardId

  [[Capture_Service#GetCardTypeList|Capture/GetCardTypeList]]            type: GET 
  
    Params:  (none)

  [[Capture_Service#GetDiseqcConfigList|Capture/GetDiseqcConfigList]]        type: GET 
  
    Params:  (none)

  [[Capture_Service#GetDiseqcTreeList|Capture/GetDiseqcTreeList]]          type: GET 
  
    Params:  (none)

  [[Capture_Service#GetRecProfileGroupList|Capture/GetRecProfileGroupList]]     type: GET 
  
  Params: GroupId, OnlyInUse, ProfileId

  [[Capture_Service#GetUserInputGroupList|Capture/GetUserInputGroupList]]      type: GET 
  
    Params:  (none)

  [[Capture_Service#LinkInputGroup|Capture/LinkInputGroup]]             type: POST
  
  Params: InputGroupId, InputId

  [[Capture_Service#RemoveAllCaptureCards|Capture/RemoveAllCaptureCards]]      type: POST
  
    Params:  (none)

  [[Capture_Service#RemoveCaptureCard|Capture/RemoveCaptureCard]]          type: POST
  
  Params: CardId

  [[Capture_Service#RemoveCardInput|Capture/RemoveCardInput]]            type: POST
  
  Params: CardInputId

  [[Capture_Service#RemoveDiseqcConfig|Capture/RemoveDiseqcConfig]]         type: POST
  
  Params: CardId

  [[Capture_Service#RemoveDiseqcTree|Capture/RemoveDiseqcTree]]           type: POST
  
  Params: DiSEqCId

  [[Capture_Service#SetInputMaxRecordings|Capture/SetInputMaxRecordings]]      type: POST
  
  Params: InputId, Max

  [[Capture_Service#UnlinkInputGroup|Capture/UnlinkInputGroup]]           type: POST
  
  Params: InputGroupId, InputId

  [[Capture_Service#UpdateCaptureCard|Capture/UpdateCaptureCard]]          type: POST
  
  Params: CardId, Setting, Value

  [[Capture_Service#UpdateCardInput|Capture/UpdateCardInput]]            type: POST
  
  Params: CardInputId, Setting, Value

  [[Capture_Service#UpdateDiseqcTree|Capture/UpdateDiseqcTree]]           type: POST
  
  Params: Address, CmdRepeat, Description, DiSEqCId, LnbLofHi, LnbLofLo, 
          LnbLofSwitch, LnbPolInv, Ordinal, ParentId, RotorHiSpeed, RotorLoSpeed, 
          RotorPositions, ScrFrequency, ScrPin, ScrUserband, SubType, SwitchPorts, 
          Type

  [[Capture_Service#UpdateRecProfile|Capture/UpdateRecProfile]]           type: POST
  
  Params: AudioCodec, ProfileId, VideoCodec

  [[Capture_Service#UpdateRecProfileParam|Capture/UpdateRecProfileParam]]      type: POST
  
  Params: Name, ProfileId, Value

====Channel  service====
  [[Channel_Service#AddDBChannel|Channel/AddDBChannel]]               type: POST
  
  Params: ATSCMajorChannel, ATSCMinorChannel, CallSign, ChannelID, ChannelName, 
          ChannelNumber, CommMethod, DefaultAuthority, ExtendedVisible, 
          Format, FrequencyID, Icon, MplexID, RecPriority, ServiceID, ServiceType, 
          SourceID, TimeOffset, UseEIT, Visible, XMLTVID

  [[Channel_Service#AddVideoSource|Channel/AddVideoSource]]             type: POST
  
  Params: BouquetId, ConfigPath, FreqTable, Grabber, LCNOffset, LineupId, 
          NITId, Password, RegionId, ScanFrequency, SourceName, UseEIT, 
          UserId

  [[Channel_Service#FetchChannelsFromSource|Channel/FetchChannelsFromSource]]    type: GET 
  
  Params: CardId, SourceId, WaitForFinish

  [[Channel_Service#GetAvailableChanid|Channel/GetAvailableChanid]]         type: GET 
  
    Params:  (none)

  [[Channel_Service#GetChannelInfo|Channel/GetChannelInfo]]             type: GET 
  
  Params: ChanID

  [[Channel_Service#GetChannelInfoList|Channel/GetChannelInfoList]]         type: GET 
  
  Params: ChannelGroupID, Count, Details, GroupByCallsign, OnlyTunable, 
          OnlyVisible, OrderByName, SourceID, StartIndex

  [[Channel_Service#GetCommMethodList|Channel/GetCommMethodList]]          type: GET 
  
    Params:  (none)

  [[Channel_Service#GetDDLineupList|Channel/GetDDLineupList]]            type: GET 
  
  Params: Password, Source, UserId

  [[Channel_Service#GetFreqTableList|Channel/GetFreqTableList]]           type: GET 
  
    Params:  (none)

  [[Channel_Service#GetGrabberList|Channel/GetGrabberList]]             type: GET 
  
    Params:  (none)

  [[Channel_Service#GetScanList|Channel/GetScanList]]                type: GET 
  
  Params: SourceId

  [[Channel_Service#GetScanStatus|Channel/GetScanStatus]]              type: GET 
  
    Params:  (none)

  [[Channel_Service#GetVideoMultiplex|Channel/GetVideoMultiplex]]          type: GET 
  
  Params: MplexID

  [[Channel_Service#GetVideoMultiplexList|Channel/GetVideoMultiplexList]]      type: GET 
  
  Params: Count, SourceID, StartIndex

  [[Channel_Service#GetVideoSource|Channel/GetVideoSource]]             type: GET 
  
  Params: SourceID

  [[Channel_Service#GetVideoSourceList|Channel/GetVideoSourceList]]         type: GET 
  
    Params:  (none)

  [[Channel_Service#GetXMLTVIdList|Channel/GetXMLTVIdList]]             type: GET 
  
  Params: SourceID

  [[Channel_Service#RemoveAllVideoSources|Channel/RemoveAllVideoSources]]      type: POST
  
    Params:  (none)

  [[Channel_Service#RemoveDBChannel|Channel/RemoveDBChannel]]            type: POST
  
  Params: ChannelID

  [[Channel_Service#RemoveVideoSource|Channel/RemoveVideoSource]]          type: POST
  
  Params: SourceID

  [[Channel_Service#StartScan|Channel/StartScan]]                  type: POST
  
  Params: AddFullTS, Bandwidth, CardId, ChannelNumbersOnly, CodeRateHP, 
          CodeRateLP, CompleteChannelsOnly, Constellation, DesiredServices, 
          FEC, FirstChan, FollowNITSetting, FreeToAirOnly, FreqTable, Frequency, 
          FullChannelSearch, GuardInterval, Hierarchy, IgnoreSignalTimeout, 
          Inversion, LastChan, ModSys, Modulation, MplexId, Polarity, RemoveDuplicates, 
          RollOff, ScanId, ScanType, SymbolRate, TestDecryptable, TransmissionMode

  [[Channel_Service#StopScan|Channel/StopScan]]                   type: POST
  
  Params: Cardid

  [[Channel_Service#UpdateDBChannel|Channel/UpdateDBChannel]]            type: POST
  
  Params: ATSCMajorChannel, ATSCMinorChannel, CallSign, ChannelID, ChannelName, 
          ChannelNumber, CommMethod, DefaultAuthority, ExtendedVisible, 
          Format, FrequencyID, Icon, MplexID, RecPriority, ServiceID, ServiceType, 
          SourceID, TimeOffset, UseEIT, Visible, XMLTVID

  [[Channel_Service#UpdateVideoSource|Channel/UpdateVideoSource]]          type: POST
  
  Params: BouquetId, ConfigPath, FreqTable, Grabber, LCNOffset, LineupId, 
          NITId, Password, RegionId, ScanFrequency, SourceID, SourceName, 
          UseEIT, UserId

====Content  service====
  [[Content_Service#DownloadFile|Content/DownloadFile]]               type: POST
  
  Params: StorageGroup, URL

  [[Content_Service#GetAlbumArt|Content/GetAlbumArt]]                type: GET 
  
  Params: Height, Id, Width

  [[Content_Service#GetDirList|Content/GetDirList]]                 type: GET 
  
  Params: StorageGroup

  [[Content_Service#GetFile|Content/GetFile]]                    type: GET 
  
  Params: FileName, StorageGroup

  [[Content_Service#GetFileList|Content/GetFileList]]                type: GET 
  
  Params: StorageGroup

  [[Content_Service#GetHash|Content/GetHash]]                    type: GET 
  
  Params: FileName, StorageGroup

  [[Content_Service#GetImageFile|Content/GetImageFile]]               type: GET 
  
  Params: FileName, Height, StorageGroup, Width

  [[Content_Service#GetMusic|Content/GetMusic]]                   type: GET 
  
  Params: Id

  [[Content_Service#GetPreviewImage|Content/GetPreviewImage]]            type: GET 
  
  Params: ChanId, Format, Height, RecordedId, SecsIn, StartTime, Width

  [[Content_Service#GetProgramArtworkList|Content/GetProgramArtworkList]]      type: GET 
  
  Params: Inetref, Season

  [[Content_Service#GetRecording|Content/GetRecording]]               type: GET 
  
  Params: ChanId, RecordedId, StartTime

  [[Content_Service#GetRecordingArtwork|Content/GetRecordingArtwork]]        type: GET 
  
  Params: Height, Inetref, Season, Type, Width

  [[Content_Service#GetRecordingArtworkList|Content/GetRecordingArtworkList]]    type: GET 
  
  Params: ChanId, RecordedId, StartTime

  [[Content_Service#GetVideo|Content/GetVideo]]                   type: GET 
  
  Params: Id

  [[Content_Service#GetVideoArtwork|Content/GetVideoArtwork]]            type: GET 
  
  Params: Height, Id, Type, Width

====Dvr  service====
  [[DVR_Service#AddDontRecordSchedule|Dvr/AddDontRecordSchedule]]          type: POST
  
  Params: ChanId, NeverRecord, StartTime

  [[DVR_Service#AddRecordSchedule|Dvr/AddRecordSchedule]]              type: POST
  
  Params: AutoCommflag, AutoExpire, AutoExtend, AutoMetaLookup, AutoTranscode, 
          AutoUserJob1, AutoUserJob2, AutoUserJob3, AutoUserJob4, Category, 
          ChanId, Description, DupIn, DupMethod, EndOffset, EndTime, Episode, 
          Filter, FindDay, FindTime, Inactive, Inetref, LastRecorded, MaxEpisodes, 
          MaxNewest, NewEpisOnly, ParentId, PlayGroup, PreferredInput, 
          ProgramId, RecGroup, RecPriority, RecProfile, SearchType, Season, 
          SeriesId, StartOffset, StartTime, Station, StorageGroup, Subtitle, 
          Title, Transcoder, Type

  [[DVR_Service#AddRecordedCredits|Dvr/AddRecordedCredits]]             type: POST
  
  Params: Cast, RecordedId

  [[DVR_Service#AddRecordedProgram|Dvr/AddRecordedProgram]]             type: POST
  
  Params: Program

  [[DVR_Service#AllowReRecord|Dvr/AllowReRecord]]                  type: POST
  
  Params: RecordedId

  [[DVR_Service#DeleteRecording|Dvr/DeleteRecording]]                type: POST
  
  Params: AllowRerecord, ChanId, ForceDelete, RecordedId, StartTime

  [[DVR_Service#DisableRecordSchedule|Dvr/DisableRecordSchedule]]          type: POST
  
  Params: RecordId

  [[DVR_Service#DupInToDescription|Dvr/DupInToDescription]]             type: GET 
  
  Params: DupIn

  [[DVR_Service#DupInToString|Dvr/DupInToString]]                  type: GET 
  
  Params: DupIn

  [[DVR_Service#DupMethodToDescription|Dvr/DupMethodToDescription]]         type: GET 
  
  Params: DupMethod

  [[DVR_Service#DupMethodToString|Dvr/DupMethodToString]]              type: GET 
  
  Params: DupMethod

  [[DVR_Service#EnableRecordSchedule|Dvr/EnableRecordSchedule]]           type: POST
  
  Params: RecordId

  [[DVR_Service#GetConflictList|Dvr/GetConflictList]]                type: GET 
  
  Params: Count, RecordId, StartIndex

  [[DVR_Service#GetEncoderList|Dvr/GetEncoderList]]                 type: GET 
  
    Params:  (none)

  [[DVR_Service#GetExpiringList|Dvr/GetExpiringList]]                type: GET 
  
  Params: Count, StartIndex

  [[DVR_Service#GetInputList|Dvr/GetInputList]]                   type: GET 
  
    Params:  (none)

  [[DVR_Service#GetLastPlayPos|Dvr/GetLastPlayPos]]                 type: GET 
  
  Params: ChanId, OffsetType, RecordedId, StartTime

  [[DVR_Service#GetOldRecordedList|Dvr/GetOldRecordedList]]             type: GET 
  
  Params: Count, Descending, EndTime, RecordId, SeriesId, Sort, StartIndex, 
          StartTime, Title

  [[DVR_Service#GetPlayGroupList|Dvr/GetPlayGroupList]]               type: GET 
  
    Params:  (none)

  [[DVR_Service#GetProgramCategories|Dvr/GetProgramCategories]]           type: GET 
  
  Params: OnlyRecorded

  [[DVR_Service#GetRecGroupList|Dvr/GetRecGroupList]]                type: GET 
  
    Params:  (none)

  [[DVR_Service#GetRecRuleFilterList|Dvr/GetRecRuleFilterList]]           type: GET 
  
    Params:  (none)

  [[DVR_Service#GetRecStorageGroupList|Dvr/GetRecStorageGroupList]]         type: GET 
  
    Params:  (none)

  [[DVR_Service#GetRecordSchedule|Dvr/GetRecordSchedule]]              type: GET 
  
  Params: ChanId, MakeOverride, RecordId, RecordedId, StartTime, Template

  [[DVR_Service#GetRecordScheduleList|Dvr/GetRecordScheduleList]]          type: GET 
  
  Params: Count, Descending, Sort, StartIndex

  [[DVR_Service#GetRecorded|Dvr/GetRecorded]]                    type: GET 
  
  Params: ChanId, RecordedId, StartTime

  [[DVR_Service#GetRecordedCommBreak|Dvr/GetRecordedCommBreak]]           type: GET 
  
  Params: ChanId, OffsetType, RecordedId, StartTime

  [[DVR_Service#GetRecordedCutList|Dvr/GetRecordedCutList]]             type: GET 
  
  Params: ChanId, OffsetType, RecordedId, StartTime

  [[DVR_Service#GetRecordedList|Dvr/GetRecordedList]]                type: GET 
  
  Params: Category, Count, Descending, Details, IgnoreDeleted, IgnoreLiveTV, 
          IncArtWork, IncCast, IncChannel, IncRecording, RecGroup, Sort, 
          StartIndex, StorageGroup, TitleRegEx

  [[DVR_Service#GetRecordedMarkup|Dvr/GetRecordedMarkup]]              type: GET 
  
  Params: RecordedId

  [[DVR_Service#GetRecordedSeek|Dvr/GetRecordedSeek]]                type: GET 
  
  Params: OffsetType, RecordedId

  [[DVR_Service#GetSavedBookmark|Dvr/GetSavedBookmark]]               type: GET 
  
  Params: ChanId, OffsetType, RecordedId, StartTime

  [[DVR_Service#GetTitleInfoList|Dvr/GetTitleInfoList]]               type: GET 
  
    Params:  (none)

  [[DVR_Service#GetTitleList|Dvr/GetTitleList]]                   type: GET 
  
  Params: RecGroup

  [[DVR_Service#GetUpcomingList|Dvr/GetUpcomingList]]                type: GET 
  
  Params: Count, RecStatus, RecordId, ShowAll, StartIndex

  [[DVR_Service#ManageJobQueue|Dvr/ManageJobQueue]]                 type: POST
  
  Params: Action, JobArgs, JobId, JobName, JobStartTime, RecordedId, RemoteHost

  [[DVR_Service#ReactivateRecording|Dvr/ReactivateRecording]]            type: POST
  
  Params: ChanId, RecordedId, StartTime

  [[DVR_Service#RecStatusToDescription|Dvr/RecStatusToDescription]]         type: GET 
  
  Params: RecStatus, RecType, StartTime

  [[DVR_Service#RecStatusToString|Dvr/RecStatusToString]]              type: GET 
  
  Params: RecStatus

  [[DVR_Service#RecTypeToDescription|Dvr/RecTypeToDescription]]           type: GET 
  
  Params: RecType

  [[DVR_Service#RecTypeToString|Dvr/RecTypeToString]]                type: GET 
  
  Params: RecType

  [[DVR_Service#RecordedIdForKey|Dvr/RecordedIdForKey]]               type: GET 
  
  Params: ChanId, StartTime

  [[DVR_Service#RecordedIdForPathname|Dvr/RecordedIdForPathname]]          type: GET 
  
  Params: Pathname

  [[DVR_Service#RemoveRecordSchedule|Dvr/RemoveRecordSchedule]]           type: POST
  
  Params: RecordId

  [[DVR_Service#RemoveRecorded|Dvr/RemoveRecorded]]                 type: POST
  
  Params: AllowRerecord, ChanId, ForceDelete, RecordedId, StartTime

  [[DVR_Service#RescheduleRecordings|Dvr/RescheduleRecordings]]           type: POST
  
    Params:  (none)

  [[DVR_Service#SetLastPlayPos|Dvr/SetLastPlayPos]]                 type: POST
  
  Params: ChanId, Offset, OffsetType, RecordedId, StartTime

  [[DVR_Service#SetRecordedMarkup|Dvr/SetRecordedMarkup]]              type: POST
  
  Params: MarkupList, RecordedId

  [[DVR_Service#SetSavedBookmark|Dvr/SetSavedBookmark]]               type: POST
  
  Params: ChanId, Offset, OffsetType, RecordedId, StartTime

  [[DVR_Service#StopRecording|Dvr/StopRecording]]                  type: POST
  
  Params: RecordedId

  [[DVR_Service#UnDeleteRecording|Dvr/UnDeleteRecording]]              type: POST
  
  Params: ChanId, RecordedId, StartTime

  [[DVR_Service#UpdateRecordSchedule|Dvr/UpdateRecordSchedule]]           type: POST
  
  Params: AutoCommflag, AutoExpire, AutoExtend, AutoMetaLookup, AutoTranscode, 
          AutoUserJob1, AutoUserJob2, AutoUserJob3, AutoUserJob4, Category, 
          ChanId, Description, DupIn, DupMethod, EndOffset, EndTime, Episode, 
          Filter, FindDay, FindTime, Inactive, Inetref, MaxEpisodes, MaxNewest, 
          NewEpisOnly, PlayGroup, PreferredInput, ProgramId, RecGroup, 
          RecPriority, RecProfile, RecordId, SearchType, Season, SeriesId, 
          StartOffset, StartTime, Station, StorageGroup, Subtitle, Title, 
          Transcoder, Type

  [[DVR_Service#UpdateRecordedMetadata|Dvr/UpdateRecordedMetadata]]         type: POST
  
  Params: AutoExpire, BookmarkOffset, BookmarkOffsetType, Damaged, Description, 
          Episode, Inetref, OriginalAirDate, Preserve, RecGroup, RecordedId, 
          Season, Stars, SubTitle, Title, Watched

  [[DVR_Service#UpdateRecordedWatchedStatus|Dvr/UpdateRecordedWatchedStatus]]    type: POST
  
  Params: ChanId, RecordedId, StartTime, Watched

====Frontend  service====
  [[Frontend_Service#GetActionList|Frontend/GetActionList]]             type: GET 
  
  Params: Context

  [[Frontend_Service#GetContextList|Frontend/GetContextList]]            type: GET 
  
    Params:  (none)

  [[Frontend_Service#GetStatus|Frontend/GetStatus]]                 type: GET 
  
    Params:  (none)

  [[Frontend_Service#PlayRecording|Frontend/PlayRecording]]             type: POST
  
  Params: ChanId, RecordedId, StartTime

  [[Frontend_Service#PlayVideo|Frontend/PlayVideo]]                 type: POST
  
  Params: Id, UseBookmark

  [[Frontend_Service#SendAction|Frontend/SendAction]]                type: POST
  
  Params: Action, Height, Value, Width

  [[Frontend_Service#SendKey|Frontend/SendKey]]                   type: POST
  
  Params: Key

  [[Frontend_Service#SendMessage|Frontend/SendMessage]]               type: POST
  
  Params: Message, Timeout

  [[Frontend_Service#SendNotification|Frontend/SendNotification]]          type: POST
  
  Params: Description, Error, Extra, Fullscreen, Image, Message, Origin, 
          Priority, Progress, ProgressText, Timeout, Type, Visibility

====Guide  service====
  [[Guide_Service#AddToChannelGroup|Guide/AddToChannelGroup]]            type: POST
  
  Params: ChanId, ChannelGroupId

  [[Guide_Service#GetCategoryList|Guide/GetCategoryList]]              type: GET 
  
    Params:  (none)

  [[Guide_Service#GetChannelGroupList|Guide/GetChannelGroupList]]          type: GET 
  
  Params: IncludeEmpty

  [[Guide_Service#GetChannelIcon|Guide/GetChannelIcon]]               type: GET 
  
  Params: ChanId, Height, Width

  [[Guide_Service#GetProgramDetails|Guide/GetProgramDetails]]            type: GET 
  
  Params: ChanId, StartTime

  [[Guide_Service#GetProgramGuide|Guide/GetProgramGuide]]              type: GET 
  
  Params: ChannelGroupId, Count, Details, EndTime, StartIndex, StartTime, 
          WithInvisible

  [[Guide_Service#GetProgramList|Guide/GetProgramList]]               type: GET 
  
  Params: CategoryFilter, ChanId, Count, Descending, Details, EndTime, 
          KeywordFilter, OnlyNew, PersonFilter, Sort, StartIndex, StartTime, 
          TitleFilter, WithInvisible

  [[Guide_Service#GetStoredSearches|Guide/GetStoredSearches]]            type: GET 
  
  Params: Type

  [[Guide_Service#RemoveFromChannelGroup|Guide/RemoveFromChannelGroup]]       type: POST
  
  Params: ChanId, ChannelGroupId

====Myth  service====
  [[Myth_Service#AddStorageGroupDir|Myth/AddStorageGroupDir]]            type: POST
  
  Params: DirName, GroupName, HostName

  [[Myth_Service#BackupDatabase|Myth/BackupDatabase]]                type: POST
  
    Params:  (none)

  [[Myth_Service#CheckDatabase|Myth/CheckDatabase]]                 type: POST
  
  Params: Repair

  [[Myth_Service#DelayShutdown|Myth/DelayShutdown]]                 type: POST
  
    Params:  (none)

  [[Myth_Service#DeleteSetting|Myth/DeleteSetting]]                 type: POST
  
  Params: HostName, Key

  [[Myth_Service#GetBackendInfo|Myth/GetBackendInfo]]                type: GET 
  
    Params:  (none)

  [[Myth_Service#GetConnectionInfo|Myth/GetConnectionInfo]]             type: GET 
  
  Params: Pin

  [[Myth_Service#GetDirListing|Myth/GetDirListing]]                 type: GET 
  
  Params: DirName

  [[Myth_Service#GetFormatDate|Myth/GetFormatDate]]                 type: GET 
  
  Params: Date, ShortDate

  [[Myth_Service#GetFormatDateTime|Myth/GetFormatDateTime]]             type: GET 
  
  Params: DateTime, ShortDate

  [[Myth_Service#GetFormatTime|Myth/GetFormatTime]]                 type: GET 
  
  Params: Time

  [[Myth_Service#GetFrontends|Myth/GetFrontends]]                  type: GET 
  
  Params: OnLine

  [[Myth_Service#GetHostName|Myth/GetHostName]]                   type: GET 
  
    Params:  (none)

  [[Myth_Service#GetHosts|Myth/GetHosts]]                      type: GET 
  
    Params:  (none)

  [[Myth_Service#GetKeys|Myth/GetKeys]]                       type: GET 
  
    Params:  (none)

  [[Myth_Service#GetLogs|Myth/GetLogs]]                       type: GET 
  
  Params: Application, Filename, FromTime, Function, HostName, Level, Line, 
          MsgContains, PID, TID, Thread, ToTime

  [[Myth_Service#GetSetting|Myth/GetSetting]]                    type: GET 
  
  Params: Default, HostName, Key

  [[Myth_Service#GetSettingList|Myth/GetSettingList]]                type: GET 
  
  Params: HostName

  [[Myth_Service#GetStorageGroupDirs|Myth/GetStorageGroupDirs]]           type: GET 
  
  Params: GroupName, HostName

  [[Myth_Service#GetTimeZone|Myth/GetTimeZone]]                   type: GET 
  
    Params:  (none)

  [[Myth_Service#ManageDigestUser|Myth/ManageDigestUser]]              type: POST
  
  Params: Action, AdminPassword, NewPassword, Password, UserName

  [[Myth_Service#ManageScheduler|Myth/ManageScheduler]]               type: POST
  
  Params: Disable, Enable

  [[Myth_Service#ManageUrlProtection|Myth/ManageUrlProtection]]           type: POST
  
  Params: AdminPassword, Services

  [[Myth_Service#ParseISODateString|Myth/ParseISODateString]]            type: GET 
  
  Params: DateTime

  [[Myth_Service#ProfileDelete|Myth/ProfileDelete]]                 type: POST
  
    Params:  (none)

  [[Myth_Service#ProfileSubmit|Myth/ProfileSubmit]]                 type: POST
  
    Params:  (none)

  [[Myth_Service#ProfileText|Myth/ProfileText]]                   type: GET 
  
    Params:  (none)

  [[Myth_Service#ProfileURL|Myth/ProfileURL]]                    type: GET 
  
    Params:  (none)

  [[Myth_Service#ProfileUpdated|Myth/ProfileUpdated]]                type: GET 
  
    Params:  (none)

  [[Myth_Service#PutSetting|Myth/PutSetting]]                    type: POST
  
  Params: HostName, Key, Value

  [[Myth_Service#RemoveStorageGroupDir|Myth/RemoveStorageGroupDir]]         type: POST
  
  Params: DirName, GroupName, HostName

  [[Myth_Service#SendMessage|Myth/SendMessage]]                   type: POST
  
  Params: Address, Message, Timeout, udpPort

  [[Myth_Service#SendNotification|Myth/SendNotification]]              type: POST
  
  Params: Address, Description, Error, Extra, Fullscreen, Image, Message, 
          Origin, Priority, Progress, ProgressText, Timeout, Type, Visibility, 
          udpPort

  [[Myth_Service#SetConnectionInfo|Myth/SetConnectionInfo]]             type: POST
  
  Params: DoTest, Host, Name, Password, Port, UserName

  [[Myth_Service#Shutdown|Myth/Shutdown]]                      type: POST
  
  Params: Restart, Retcode

  [[Myth_Service#TestDBSettings|Myth/TestDBSettings]]                type: POST
  
  Params: DBName, HostName, Password, UserName, dbPort

====Video  service====
  [[Video_Service#AddVideo|Video/AddVideo]]                     type: POST
  
  Params: FileName, HostName

  [[Video_Service#GetBluray|Video/GetBluray]]                    type: GET 
  
  Params: Path

  [[Video_Service#GetLastPlayPos|Video/GetLastPlayPos]]               type: GET 
  
  Params: Id

  [[Video_Service#GetSavedBookmark|Video/GetSavedBookmark]]             type: GET 
  
  Params: Id

  [[Video_Service#GetStreamInfo|Video/GetStreamInfo]]                type: GET 
  
  Params: FileName, StorageGroup

  [[Video_Service#GetVideo|Video/GetVideo]]                     type: GET 
  
  Params: Id

  [[Video_Service#GetVideoByFileName|Video/GetVideoByFileName]]           type: GET 
  
  Params: FileName

  [[Video_Service#GetVideoCommBreak|Video/GetVideoCommBreak]]            type: GET 
  
  Params: Id, OffsetType

  [[Video_Service#GetVideoCutList|Video/GetVideoCutList]]              type: GET 
  
  Params: Id, OffsetType

  [[Video_Service#GetVideoList|Video/GetVideoList]]                 type: GET 
  
  Params: CollapseSubDirs, Count, Descending, Folder, Sort, StartIndex

  [[Video_Service#LookupVideo|Video/LookupVideo]]                  type: GET 
  
  Params: AllowGeneric, Episode, GrabberType, Inetref, Season, Subtitle, 
          Title

  [[Video_Service#RemoveVideoFromDB|Video/RemoveVideoFromDB]]            type: POST
  
  Params: Id

  [[Video_Service#SetLastPlayPos|Video/SetLastPlayPos]]               type: POST
  
  Params: Id, Offset

  [[Video_Service#SetSavedBookmark|Video/SetSavedBookmark]]             type: POST
  
  Params: Id, Offset

  [[Video_Service#UpdateVideoMetadata|Video/UpdateVideoMetadata]]          type: POST
  
  Params: Banner, Browse, Cast, Category, ChildID, CollectionRef, ContentType, 
          Countries, CoverFile, Director, Episode, Fanart, FileName, Genres, 
          Hash, HomePage, Host, Id, Inetref, InsertDate, Length, PlayCommand, 
          PlayCount, Plot, Processed, Rating, ReleaseDate, Screenshot, 
          Season, ShowLevel, Studio, SubTitle, TagLine, Title, Trailer, 
          UserRating, Watched, Year

  [[Video_Service#UpdateVideoWatchedStatus|Video/UpdateVideoWatchedStatus]]     type: POST
  
  Params: Id, Watched

[[Category:Services_API]]
[[Category:Developer_Documentation]]
