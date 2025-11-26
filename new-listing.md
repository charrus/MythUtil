API routines in 34.20220913-1 {#api_routines_in_34.20220913_1}
-----------------------------

#### Capture service {#capture_service}

` `[`Capture/AddCaptureCard`](Capture_Service#AddCaptureCard "wikilink")`             type: POST`\
` `\
` Params: AudioDevice, AudioRateLimit, Brightness, CardType, ChannelTimeout, `\
`         Colour, Contrast, DVBDiSEqCType, DVBEITScan, DVBOnDemand, DVBSWFilter, `\
`         DVBSatType, DVBTuningDelay, DVBWaitForSeqStart, DiSEqCId, FirewireConnection, `\
`         FirewireModel, FirewireSpeed, HostName, Hue, SignalTimeout, SkipBTAudio, `\
`         VBIDevice, VideoDevice`

` `[`Capture/AddCardInput`](Capture_Service#AddCardInput "wikilink")`               type: POST`\
` `\
` Params: CardId, ChangerDevice, ChangerModel, DishnetEIT, DisplayName, `\
`         ExternalCommand, HostName, InputName, LiveTVOrder, Quicktune, `\
`         RecPriority, SchedOrder, SourceId, StartChan, TuneChan`

` `[`Capture/AddDiseqcConfig`](Capture_Service#AddDiseqcConfig "wikilink")`            type: POST`\
` `\
` Params: CardId, DiSEqCId, Value`

` `[`Capture/AddDiseqcTree`](Capture_Service#AddDiseqcTree "wikilink")`              type: POST`\
` `\
` Params: Address, CmdRepeat, Description, LnbLofHi, LnbLofLo, LnbLofSwitch, `\
`         LnbPolInv, Ordinal, ParentId, RotorHiSpeed, RotorLoSpeed, RotorPositions, `\
`         ScrFrequency, ScrPin, ScrUserband, SubType, SwitchPorts, Type`

` `[`Capture/AddRecProfile`](Capture_Service#AddRecProfile "wikilink")`              type: POST`\
` `\
` Params: AudioCodec, GroupId, ProfileName, VideoCodec`

` `[`Capture/AddUserInputGroup`](Capture_Service#AddUserInputGroup "wikilink")`          type: POST`\
` `\
` Params: Name`

` `[`Capture/DeleteRecProfile`](Capture_Service#DeleteRecProfile "wikilink")`           type: POST`\
` `\
` Params: ProfileId`

` `[`Capture/GetCaptureCard`](Capture_Service#GetCaptureCard "wikilink")`             type: GET `\
` `\
` Params: CardId`

` `[`Capture/GetCaptureCardList`](Capture_Service#GetCaptureCardList "wikilink")`         type: GET `\
` `\
` Params: CardType, HostName`

` `[`Capture/GetCaptureDeviceList`](Capture_Service#GetCaptureDeviceList "wikilink")`       type: GET `\
` `\
` Params: CardType`

` `[`Capture/GetCardSubType`](Capture_Service#GetCardSubType "wikilink")`             type: GET `\
` `\
` Params: CardId`

` `[`Capture/GetCardTypeList`](Capture_Service#GetCardTypeList "wikilink")`            type: GET `\
` `\
`   Params:  (none)`

` `[`Capture/GetDiseqcConfigList`](Capture_Service#GetDiseqcConfigList "wikilink")`        type: GET `\
` `\
`   Params:  (none)`

` `[`Capture/GetDiseqcTreeList`](Capture_Service#GetDiseqcTreeList "wikilink")`          type: GET `\
` `\
`   Params:  (none)`

` `[`Capture/GetRecProfileGroupList`](Capture_Service#GetRecProfileGroupList "wikilink")`     type: GET `\
` `\
` Params: GroupId, OnlyInUse, ProfileId`

` `[`Capture/GetUserInputGroupList`](Capture_Service#GetUserInputGroupList "wikilink")`      type: GET `\
` `\
`   Params:  (none)`

` `[`Capture/LinkInputGroup`](Capture_Service#LinkInputGroup "wikilink")`             type: POST`\
` `\
` Params: InputGroupId, InputId`

` `[`Capture/RemoveAllCaptureCards`](Capture_Service#RemoveAllCaptureCards "wikilink")`      type: POST`\
` `\
`   Params:  (none)`

` `[`Capture/RemoveCaptureCard`](Capture_Service#RemoveCaptureCard "wikilink")`          type: POST`\
` `\
` Params: CardId`

` `[`Capture/RemoveCardInput`](Capture_Service#RemoveCardInput "wikilink")`            type: POST`\
` `\
` Params: CardInputId`

` `[`Capture/RemoveDiseqcConfig`](Capture_Service#RemoveDiseqcConfig "wikilink")`         type: POST`\
` `\
` Params: CardId`

` `[`Capture/RemoveDiseqcTree`](Capture_Service#RemoveDiseqcTree "wikilink")`           type: POST`\
` `\
` Params: DiSEqCId`

` `[`Capture/SetInputMaxRecordings`](Capture_Service#SetInputMaxRecordings "wikilink")`      type: POST`\
` `\
` Params: InputId, Max`

` `[`Capture/UnlinkInputGroup`](Capture_Service#UnlinkInputGroup "wikilink")`           type: POST`\
` `\
` Params: InputGroupId, InputId`

` `[`Capture/UpdateCaptureCard`](Capture_Service#UpdateCaptureCard "wikilink")`          type: POST`\
` `\
` Params: CardId, Setting, Value`

` `[`Capture/UpdateCardInput`](Capture_Service#UpdateCardInput "wikilink")`            type: POST`\
` `\
` Params: CardInputId, Setting, Value`

` `[`Capture/UpdateDiseqcTree`](Capture_Service#UpdateDiseqcTree "wikilink")`           type: POST`\
` `\
` Params: Address, CmdRepeat, Description, DiSEqCId, LnbLofHi, LnbLofLo, `\
`         LnbLofSwitch, LnbPolInv, Ordinal, ParentId, RotorHiSpeed, RotorLoSpeed, `\
`         RotorPositions, ScrFrequency, ScrPin, ScrUserband, SubType, SwitchPorts, `\
`         Type`

` `[`Capture/UpdateRecProfile`](Capture_Service#UpdateRecProfile "wikilink")`           type: POST`\
` `\
` Params: AudioCodec, ProfileId, VideoCodec`

` `[`Capture/UpdateRecProfileParam`](Capture_Service#UpdateRecProfileParam "wikilink")`      type: POST`\
` `\
` Params: Name, ProfileId, Value`

#### Channel service {#channel_service}

` `[`Channel/AddDBChannel`](Channel_Service#AddDBChannel "wikilink")`               type: POST`\
` `\
` Params: ATSCMajorChannel, ATSCMinorChannel, CallSign, ChannelID, ChannelName, `\
`         ChannelNumber, CommMethod, DefaultAuthority, ExtendedVisible, `\
`         Format, FrequencyID, Icon, MplexID, RecPriority, ServiceID, ServiceType, `\
`         SourceID, TimeOffset, UseEIT, Visible, XMLTVID`

` `[`Channel/AddVideoSource`](Channel_Service#AddVideoSource "wikilink")`             type: POST`\
` `\
` Params: BouquetId, ConfigPath, FreqTable, Grabber, LCNOffset, LineupId, `\
`         NITId, Password, RegionId, ScanFrequency, SourceName, UseEIT, `\
`         UserId`

` `[`Channel/FetchChannelsFromSource`](Channel_Service#FetchChannelsFromSource "wikilink")`    type: GET `\
` `\
` Params: CardId, SourceId, WaitForFinish`

` `[`Channel/GetAvailableChanid`](Channel_Service#GetAvailableChanid "wikilink")`         type: GET `\
` `\
`   Params:  (none)`

` `[`Channel/GetChannelInfo`](Channel_Service#GetChannelInfo "wikilink")`             type: GET `\
` `\
` Params: ChanID`

` `[`Channel/GetChannelInfoList`](Channel_Service#GetChannelInfoList "wikilink")`         type: GET `\
` `\
` Params: ChannelGroupID, Count, Details, GroupByCallsign, OnlyTunable, `\
`         OnlyVisible, OrderByName, SourceID, StartIndex`

` `[`Channel/GetCommMethodList`](Channel_Service#GetCommMethodList "wikilink")`          type: GET `\
` `\
`   Params:  (none)`

` `[`Channel/GetDDLineupList`](Channel_Service#GetDDLineupList "wikilink")`            type: GET `\
` `\
` Params: Password, Source, UserId`

` `[`Channel/GetFreqTableList`](Channel_Service#GetFreqTableList "wikilink")`           type: GET `\
` `\
`   Params:  (none)`

` `[`Channel/GetGrabberList`](Channel_Service#GetGrabberList "wikilink")`             type: GET `\
` `\
`   Params:  (none)`

` `[`Channel/GetScanList`](Channel_Service#GetScanList "wikilink")`                type: GET `\
` `\
` Params: SourceId`

` `[`Channel/GetScanStatus`](Channel_Service#GetScanStatus "wikilink")`              type: GET `\
` `\
`   Params:  (none)`

` `[`Channel/GetVideoMultiplex`](Channel_Service#GetVideoMultiplex "wikilink")`          type: GET `\
` `\
` Params: MplexID`

` `[`Channel/GetVideoMultiplexList`](Channel_Service#GetVideoMultiplexList "wikilink")`      type: GET `\
` `\
` Params: Count, SourceID, StartIndex`

` `[`Channel/GetVideoSource`](Channel_Service#GetVideoSource "wikilink")`             type: GET `\
` `\
` Params: SourceID`

` `[`Channel/GetVideoSourceList`](Channel_Service#GetVideoSourceList "wikilink")`         type: GET `\
` `\
`   Params:  (none)`

` `[`Channel/GetXMLTVIdList`](Channel_Service#GetXMLTVIdList "wikilink")`             type: GET `\
` `\
` Params: SourceID`

` `[`Channel/RemoveAllVideoSources`](Channel_Service#RemoveAllVideoSources "wikilink")`      type: POST`\
` `\
`   Params:  (none)`

` `[`Channel/RemoveDBChannel`](Channel_Service#RemoveDBChannel "wikilink")`            type: POST`\
` `\
` Params: ChannelID`

` `[`Channel/RemoveVideoSource`](Channel_Service#RemoveVideoSource "wikilink")`          type: POST`\
` `\
` Params: SourceID`

` `[`Channel/StartScan`](Channel_Service#StartScan "wikilink")`                  type: POST`\
` `\
` Params: AddFullTS, Bandwidth, CardId, ChannelNumbersOnly, CodeRateHP, `\
`         CodeRateLP, CompleteChannelsOnly, Constellation, DesiredServices, `\
`         FEC, FirstChan, FollowNITSetting, FreeToAirOnly, FreqTable, Frequency, `\
`         FullChannelSearch, GuardInterval, Hierarchy, IgnoreSignalTimeout, `\
`         Inversion, LastChan, ModSys, Modulation, MplexId, Polarity, RemoveDuplicates, `\
`         RollOff, ScanId, ScanType, SymbolRate, TestDecryptable, TransmissionMode`

` `[`Channel/StopScan`](Channel_Service#StopScan "wikilink")`                   type: POST`\
` `\
` Params: Cardid`

` `[`Channel/UpdateDBChannel`](Channel_Service#UpdateDBChannel "wikilink")`            type: POST`\
` `\
` Params: ATSCMajorChannel, ATSCMinorChannel, CallSign, ChannelID, ChannelName, `\
`         ChannelNumber, CommMethod, DefaultAuthority, ExtendedVisible, `\
`         Format, FrequencyID, Icon, MplexID, RecPriority, ServiceID, ServiceType, `\
`         SourceID, TimeOffset, UseEIT, Visible, XMLTVID`

` `[`Channel/UpdateVideoSource`](Channel_Service#UpdateVideoSource "wikilink")`          type: POST`\
` `\
` Params: BouquetId, ConfigPath, FreqTable, Grabber, LCNOffset, LineupId, `\
`         NITId, Password, RegionId, ScanFrequency, SourceID, SourceName, `\
`         UseEIT, UserId`

#### Content service {#content_service}

` `[`Content/DownloadFile`](Content_Service#DownloadFile "wikilink")`               type: POST`\
` `\
` Params: StorageGroup, URL`

` `[`Content/GetAlbumArt`](Content_Service#GetAlbumArt "wikilink")`                type: GET `\
` `\
` Params: Height, Id, Width`

` `[`Content/GetDirList`](Content_Service#GetDirList "wikilink")`                 type: GET `\
` `\
` Params: StorageGroup`

` `[`Content/GetFile`](Content_Service#GetFile "wikilink")`                    type: GET `\
` `\
` Params: FileName, StorageGroup`

` `[`Content/GetFileList`](Content_Service#GetFileList "wikilink")`                type: GET `\
` `\
` Params: StorageGroup`

` `[`Content/GetHash`](Content_Service#GetHash "wikilink")`                    type: GET `\
` `\
` Params: FileName, StorageGroup`

` `[`Content/GetImageFile`](Content_Service#GetImageFile "wikilink")`               type: GET `\
` `\
` Params: FileName, Height, StorageGroup, Width`

` `[`Content/GetMusic`](Content_Service#GetMusic "wikilink")`                   type: GET `\
` `\
` Params: Id`

` `[`Content/GetPreviewImage`](Content_Service#GetPreviewImage "wikilink")`            type: GET `\
` `\
` Params: ChanId, Format, Height, RecordedId, SecsIn, StartTime, Width`

` `[`Content/GetProgramArtworkList`](Content_Service#GetProgramArtworkList "wikilink")`      type: GET `\
` `\
` Params: Inetref, Season`

` `[`Content/GetRecording`](Content_Service#GetRecording "wikilink")`               type: GET `\
` `\
` Params: ChanId, RecordedId, StartTime`

` `[`Content/GetRecordingArtwork`](Content_Service#GetRecordingArtwork "wikilink")`        type: GET `\
` `\
` Params: Height, Inetref, Season, Type, Width`

` `[`Content/GetRecordingArtworkList`](Content_Service#GetRecordingArtworkList "wikilink")`    type: GET `\
` `\
` Params: ChanId, RecordedId, StartTime`

` `[`Content/GetVideo`](Content_Service#GetVideo "wikilink")`                   type: GET `\
` `\
` Params: Id`

` `[`Content/GetVideoArtwork`](Content_Service#GetVideoArtwork "wikilink")`            type: GET `\
` `\
` Params: Height, Id, Type, Width`

#### Dvr service {#dvr_service}

` `[`Dvr/AddDontRecordSchedule`](DVR_Service#AddDontRecordSchedule "wikilink")`          type: POST`\
` `\
` Params: ChanId, NeverRecord, StartTime`

` `[`Dvr/AddRecordSchedule`](DVR_Service#AddRecordSchedule "wikilink")`              type: POST`\
` `\
` Params: AutoCommflag, AutoExpire, AutoExtend, AutoMetaLookup, AutoTranscode, `\
`         AutoUserJob1, AutoUserJob2, AutoUserJob3, AutoUserJob4, Category, `\
`         ChanId, Description, DupIn, DupMethod, EndOffset, EndTime, Episode, `\
`         Filter, FindDay, FindTime, Inactive, Inetref, LastRecorded, MaxEpisodes, `\
`         MaxNewest, NewEpisOnly, ParentId, PlayGroup, PreferredInput, `\
`         ProgramId, RecGroup, RecPriority, RecProfile, SearchType, Season, `\
`         SeriesId, StartOffset, StartTime, Station, StorageGroup, Subtitle, `\
`         Title, Transcoder, Type`

` `[`Dvr/AddRecordedCredits`](DVR_Service#AddRecordedCredits "wikilink")`             type: POST`\
` `\
` Params: Cast, RecordedId`

` `[`Dvr/AddRecordedProgram`](DVR_Service#AddRecordedProgram "wikilink")`             type: POST`\
` `\
` Params: Program`

` `[`Dvr/AllowReRecord`](DVR_Service#AllowReRecord "wikilink")`                  type: POST`\
` `\
` Params: RecordedId`

` `[`Dvr/DeleteRecording`](DVR_Service#DeleteRecording "wikilink")`                type: POST`\
` `\
` Params: AllowRerecord, ChanId, ForceDelete, RecordedId, StartTime`

` `[`Dvr/DisableRecordSchedule`](DVR_Service#DisableRecordSchedule "wikilink")`          type: POST`\
` `\
` Params: RecordId`

` `[`Dvr/DupInToDescription`](DVR_Service#DupInToDescription "wikilink")`             type: GET `\
` `\
` Params: DupIn`

` `[`Dvr/DupInToString`](DVR_Service#DupInToString "wikilink")`                  type: GET `\
` `\
` Params: DupIn`

` `[`Dvr/DupMethodToDescription`](DVR_Service#DupMethodToDescription "wikilink")`         type: GET `\
` `\
` Params: DupMethod`

` `[`Dvr/DupMethodToString`](DVR_Service#DupMethodToString "wikilink")`              type: GET `\
` `\
` Params: DupMethod`

` `[`Dvr/EnableRecordSchedule`](DVR_Service#EnableRecordSchedule "wikilink")`           type: POST`\
` `\
` Params: RecordId`

` `[`Dvr/GetConflictList`](DVR_Service#GetConflictList "wikilink")`                type: GET `\
` `\
` Params: Count, RecordId, StartIndex`

` `[`Dvr/GetEncoderList`](DVR_Service#GetEncoderList "wikilink")`                 type: GET `\
` `\
`   Params:  (none)`

` `[`Dvr/GetExpiringList`](DVR_Service#GetExpiringList "wikilink")`                type: GET `\
` `\
` Params: Count, StartIndex`

` `[`Dvr/GetInputList`](DVR_Service#GetInputList "wikilink")`                   type: GET `\
` `\
`   Params:  (none)`

` `[`Dvr/GetLastPlayPos`](DVR_Service#GetLastPlayPos "wikilink")`                 type: GET `\
` `\
` Params: ChanId, OffsetType, RecordedId, StartTime`

` `[`Dvr/GetOldRecordedList`](DVR_Service#GetOldRecordedList "wikilink")`             type: GET `\
` `\
` Params: Count, Descending, EndTime, RecordId, SeriesId, Sort, StartIndex, `\
`         StartTime, Title`

` `[`Dvr/GetPlayGroupList`](DVR_Service#GetPlayGroupList "wikilink")`               type: GET `\
` `\
`   Params:  (none)`

` `[`Dvr/GetProgramCategories`](DVR_Service#GetProgramCategories "wikilink")`           type: GET `\
` `\
` Params: OnlyRecorded`

` `[`Dvr/GetRecGroupList`](DVR_Service#GetRecGroupList "wikilink")`                type: GET `\
` `\
`   Params:  (none)`

` `[`Dvr/GetRecRuleFilterList`](DVR_Service#GetRecRuleFilterList "wikilink")`           type: GET `\
` `\
`   Params:  (none)`

` `[`Dvr/GetRecStorageGroupList`](DVR_Service#GetRecStorageGroupList "wikilink")`         type: GET `\
` `\
`   Params:  (none)`

` `[`Dvr/GetRecordSchedule`](DVR_Service#GetRecordSchedule "wikilink")`              type: GET `\
` `\
` Params: ChanId, MakeOverride, RecordId, RecordedId, StartTime, Template`

` `[`Dvr/GetRecordScheduleList`](DVR_Service#GetRecordScheduleList "wikilink")`          type: GET `\
` `\
` Params: Count, Descending, Sort, StartIndex`

` `[`Dvr/GetRecorded`](DVR_Service#GetRecorded "wikilink")`                    type: GET `\
` `\
` Params: ChanId, RecordedId, StartTime`

` `[`Dvr/GetRecordedCommBreak`](DVR_Service#GetRecordedCommBreak "wikilink")`           type: GET `\
` `\
` Params: ChanId, OffsetType, RecordedId, StartTime`

` `[`Dvr/GetRecordedCutList`](DVR_Service#GetRecordedCutList "wikilink")`             type: GET `\
` `\
` Params: ChanId, OffsetType, RecordedId, StartTime`

` `[`Dvr/GetRecordedList`](DVR_Service#GetRecordedList "wikilink")`                type: GET `\
` `\
` Params: Category, Count, Descending, Details, IgnoreDeleted, IgnoreLiveTV, `\
`         IncArtWork, IncCast, IncChannel, IncRecording, RecGroup, Sort, `\
`         StartIndex, StorageGroup, TitleRegEx`

` `[`Dvr/GetRecordedMarkup`](DVR_Service#GetRecordedMarkup "wikilink")`              type: GET `\
` `\
` Params: RecordedId`

` `[`Dvr/GetRecordedSeek`](DVR_Service#GetRecordedSeek "wikilink")`                type: GET `\
` `\
` Params: OffsetType, RecordedId`

` `[`Dvr/GetSavedBookmark`](DVR_Service#GetSavedBookmark "wikilink")`               type: GET `\
` `\
` Params: ChanId, OffsetType, RecordedId, StartTime`

` `[`Dvr/GetTitleInfoList`](DVR_Service#GetTitleInfoList "wikilink")`               type: GET `\
` `\
`   Params:  (none)`

` `[`Dvr/GetTitleList`](DVR_Service#GetTitleList "wikilink")`                   type: GET `\
` `\
` Params: RecGroup`

` `[`Dvr/GetUpcomingList`](DVR_Service#GetUpcomingList "wikilink")`                type: GET `\
` `\
` Params: Count, RecStatus, RecordId, ShowAll, StartIndex`

` `[`Dvr/ManageJobQueue`](DVR_Service#ManageJobQueue "wikilink")`                 type: POST`\
` `\
` Params: Action, JobArgs, JobId, JobName, JobStartTime, RecordedId, RemoteHost`

` `[`Dvr/ReactivateRecording`](DVR_Service#ReactivateRecording "wikilink")`            type: POST`\
` `\
` Params: ChanId, RecordedId, StartTime`

` `[`Dvr/RecStatusToDescription`](DVR_Service#RecStatusToDescription "wikilink")`         type: GET `\
` `\
` Params: RecStatus, RecType, StartTime`

` `[`Dvr/RecStatusToString`](DVR_Service#RecStatusToString "wikilink")`              type: GET `\
` `\
` Params: RecStatus`

` `[`Dvr/RecTypeToDescription`](DVR_Service#RecTypeToDescription "wikilink")`           type: GET `\
` `\
` Params: RecType`

` `[`Dvr/RecTypeToString`](DVR_Service#RecTypeToString "wikilink")`                type: GET `\
` `\
` Params: RecType`

` `[`Dvr/RecordedIdForKey`](DVR_Service#RecordedIdForKey "wikilink")`               type: GET `\
` `\
` Params: ChanId, StartTime`

` `[`Dvr/RecordedIdForPathname`](DVR_Service#RecordedIdForPathname "wikilink")`          type: GET `\
` `\
` Params: Pathname`

` `[`Dvr/RemoveRecordSchedule`](DVR_Service#RemoveRecordSchedule "wikilink")`           type: POST`\
` `\
` Params: RecordId`

` `[`Dvr/RemoveRecorded`](DVR_Service#RemoveRecorded "wikilink")`                 type: POST`\
` `\
` Params: AllowRerecord, ChanId, ForceDelete, RecordedId, StartTime`

` `[`Dvr/RescheduleRecordings`](DVR_Service#RescheduleRecordings "wikilink")`           type: POST`\
` `\
`   Params:  (none)`

` `[`Dvr/SetLastPlayPos`](DVR_Service#SetLastPlayPos "wikilink")`                 type: POST`\
` `\
` Params: ChanId, Offset, OffsetType, RecordedId, StartTime`

` `[`Dvr/SetRecordedMarkup`](DVR_Service#SetRecordedMarkup "wikilink")`              type: POST`\
` `\
` Params: MarkupList, RecordedId`

` `[`Dvr/SetSavedBookmark`](DVR_Service#SetSavedBookmark "wikilink")`               type: POST`\
` `\
` Params: ChanId, Offset, OffsetType, RecordedId, StartTime`

` `[`Dvr/StopRecording`](DVR_Service#StopRecording "wikilink")`                  type: POST`\
` `\
` Params: RecordedId`

` `[`Dvr/UnDeleteRecording`](DVR_Service#UnDeleteRecording "wikilink")`              type: POST`\
` `\
` Params: ChanId, RecordedId, StartTime`

` `[`Dvr/UpdateRecordSchedule`](DVR_Service#UpdateRecordSchedule "wikilink")`           type: POST`\
` `\
` Params: AutoCommflag, AutoExpire, AutoExtend, AutoMetaLookup, AutoTranscode, `\
`         AutoUserJob1, AutoUserJob2, AutoUserJob3, AutoUserJob4, Category, `\
`         ChanId, Description, DupIn, DupMethod, EndOffset, EndTime, Episode, `\
`         Filter, FindDay, FindTime, Inactive, Inetref, MaxEpisodes, MaxNewest, `\
`         NewEpisOnly, PlayGroup, PreferredInput, ProgramId, RecGroup, `\
`         RecPriority, RecProfile, RecordId, SearchType, Season, SeriesId, `\
`         StartOffset, StartTime, Station, StorageGroup, Subtitle, Title, `\
`         Transcoder, Type`

` `[`Dvr/UpdateRecordedMetadata`](DVR_Service#UpdateRecordedMetadata "wikilink")`         type: POST`\
` `\
` Params: AutoExpire, BookmarkOffset, BookmarkOffsetType, Damaged, Description, `\
`         Episode, Inetref, OriginalAirDate, Preserve, RecGroup, RecordedId, `\
`         Season, Stars, SubTitle, Title, Watched`

` `[`Dvr/UpdateRecordedWatchedStatus`](DVR_Service#UpdateRecordedWatchedStatus "wikilink")`    type: POST`\
` `\
` Params: ChanId, RecordedId, StartTime, Watched`

#### Frontend service {#frontend_service}

` `[`Frontend/GetActionList`](Frontend_Service#GetActionList "wikilink")`             type: GET `\
` `\
` Params: Context`

` `[`Frontend/GetContextList`](Frontend_Service#GetContextList "wikilink")`            type: GET `\
` `\
`   Params:  (none)`

` `[`Frontend/GetStatus`](Frontend_Service#GetStatus "wikilink")`                 type: GET `\
` `\
`   Params:  (none)`

` `[`Frontend/PlayRecording`](Frontend_Service#PlayRecording "wikilink")`             type: POST`\
` `\
` Params: ChanId, RecordedId, StartTime`

` `[`Frontend/PlayVideo`](Frontend_Service#PlayVideo "wikilink")`                 type: POST`\
` `\
` Params: Id, UseBookmark`

` `[`Frontend/SendAction`](Frontend_Service#SendAction "wikilink")`                type: POST`\
` `\
` Params: Action, Height, Value, Width`

` `[`Frontend/SendKey`](Frontend_Service#SendKey "wikilink")`                   type: POST`\
` `\
` Params: Key`

` `[`Frontend/SendMessage`](Frontend_Service#SendMessage "wikilink")`               type: POST`\
` `\
` Params: Message, Timeout`

` `[`Frontend/SendNotification`](Frontend_Service#SendNotification "wikilink")`          type: POST`\
` `\
` Params: Description, Error, Extra, Fullscreen, Image, Message, Origin, `\
`         Priority, Progress, ProgressText, Timeout, Type, Visibility`

#### Guide service {#guide_service}

` `[`Guide/AddToChannelGroup`](Guide_Service#AddToChannelGroup "wikilink")`            type: POST`\
` `\
` Params: ChanId, ChannelGroupId`

` `[`Guide/GetCategoryList`](Guide_Service#GetCategoryList "wikilink")`              type: GET `\
` `\
`   Params:  (none)`

` `[`Guide/GetChannelGroupList`](Guide_Service#GetChannelGroupList "wikilink")`          type: GET `\
` `\
` Params: IncludeEmpty`

` `[`Guide/GetChannelIcon`](Guide_Service#GetChannelIcon "wikilink")`               type: GET `\
` `\
` Params: ChanId, Height, Width`

` `[`Guide/GetProgramDetails`](Guide_Service#GetProgramDetails "wikilink")`            type: GET `\
` `\
` Params: ChanId, StartTime`

` `[`Guide/GetProgramGuide`](Guide_Service#GetProgramGuide "wikilink")`              type: GET `\
` `\
` Params: ChannelGroupId, Count, Details, EndTime, StartIndex, StartTime, `\
`         WithInvisible`

` `[`Guide/GetProgramList`](Guide_Service#GetProgramList "wikilink")`               type: GET `\
` `\
` Params: CategoryFilter, ChanId, Count, Descending, Details, EndTime, `\
`         KeywordFilter, OnlyNew, PersonFilter, Sort, StartIndex, StartTime, `\
`         TitleFilter, WithInvisible`

` `[`Guide/GetStoredSearches`](Guide_Service#GetStoredSearches "wikilink")`            type: GET `\
` `\
` Params: Type`

` `[`Guide/RemoveFromChannelGroup`](Guide_Service#RemoveFromChannelGroup "wikilink")`       type: POST`\
` `\
` Params: ChanId, ChannelGroupId`

#### Myth service {#myth_service}

` `[`Myth/AddStorageGroupDir`](Myth_Service#AddStorageGroupDir "wikilink")`            type: POST`\
` `\
` Params: DirName, GroupName, HostName`

` `[`Myth/BackupDatabase`](Myth_Service#BackupDatabase "wikilink")`                type: POST`\
` `\
`   Params:  (none)`

` `[`Myth/CheckDatabase`](Myth_Service#CheckDatabase "wikilink")`                 type: POST`\
` `\
` Params: Repair`

` `[`Myth/DelayShutdown`](Myth_Service#DelayShutdown "wikilink")`                 type: POST`\
` `\
`   Params:  (none)`

` `[`Myth/DeleteSetting`](Myth_Service#DeleteSetting "wikilink")`                 type: POST`\
` `\
` Params: HostName, Key`

` `[`Myth/GetBackendInfo`](Myth_Service#GetBackendInfo "wikilink")`                type: GET `\
` `\
`   Params:  (none)`

` `[`Myth/GetConnectionInfo`](Myth_Service#GetConnectionInfo "wikilink")`             type: GET `\
` `\
` Params: Pin`

` `[`Myth/GetDirListing`](Myth_Service#GetDirListing "wikilink")`                 type: GET `\
` `\
` Params: DirName`

` `[`Myth/GetFormatDate`](Myth_Service#GetFormatDate "wikilink")`                 type: GET `\
` `\
` Params: Date, ShortDate`

` `[`Myth/GetFormatDateTime`](Myth_Service#GetFormatDateTime "wikilink")`             type: GET `\
` `\
` Params: DateTime, ShortDate`

` `[`Myth/GetFormatTime`](Myth_Service#GetFormatTime "wikilink")`                 type: GET `\
` `\
` Params: Time`

` `[`Myth/GetFrontends`](Myth_Service#GetFrontends "wikilink")`                  type: GET `\
` `\
` Params: OnLine`

` `[`Myth/GetHostName`](Myth_Service#GetHostName "wikilink")`                   type: GET `\
` `\
`   Params:  (none)`

` `[`Myth/GetHosts`](Myth_Service#GetHosts "wikilink")`                      type: GET `\
` `\
`   Params:  (none)`

` `[`Myth/GetKeys`](Myth_Service#GetKeys "wikilink")`                       type: GET `\
` `\
`   Params:  (none)`

` `[`Myth/GetLogs`](Myth_Service#GetLogs "wikilink")`                       type: GET `\
` `\
` Params: Application, Filename, FromTime, Function, HostName, Level, Line, `\
`         MsgContains, PID, TID, Thread, ToTime`

` `[`Myth/GetSetting`](Myth_Service#GetSetting "wikilink")`                    type: GET `\
` `\
` Params: Default, HostName, Key`

` `[`Myth/GetSettingList`](Myth_Service#GetSettingList "wikilink")`                type: GET `\
` `\
` Params: HostName`

` `[`Myth/GetStorageGroupDirs`](Myth_Service#GetStorageGroupDirs "wikilink")`           type: GET `\
` `\
` Params: GroupName, HostName`

` `[`Myth/GetTimeZone`](Myth_Service#GetTimeZone "wikilink")`                   type: GET `\
` `\
`   Params:  (none)`

` `[`Myth/ManageDigestUser`](Myth_Service#ManageDigestUser "wikilink")`              type: POST`\
` `\
` Params: Action, AdminPassword, NewPassword, Password, UserName`

` `[`Myth/ManageScheduler`](Myth_Service#ManageScheduler "wikilink")`               type: POST`\
` `\
` Params: Disable, Enable`

` `[`Myth/ManageUrlProtection`](Myth_Service#ManageUrlProtection "wikilink")`           type: POST`\
` `\
` Params: AdminPassword, Services`

` `[`Myth/ParseISODateString`](Myth_Service#ParseISODateString "wikilink")`            type: GET `\
` `\
` Params: DateTime`

` `[`Myth/ProfileDelete`](Myth_Service#ProfileDelete "wikilink")`                 type: POST`\
` `\
`   Params:  (none)`

` `[`Myth/ProfileSubmit`](Myth_Service#ProfileSubmit "wikilink")`                 type: POST`\
` `\
`   Params:  (none)`

` `[`Myth/ProfileText`](Myth_Service#ProfileText "wikilink")`                   type: GET `\
` `\
`   Params:  (none)`

` `[`Myth/ProfileURL`](Myth_Service#ProfileURL "wikilink")`                    type: GET `\
` `\
`   Params:  (none)`

` `[`Myth/ProfileUpdated`](Myth_Service#ProfileUpdated "wikilink")`                type: GET `\
` `\
`   Params:  (none)`

` `[`Myth/PutSetting`](Myth_Service#PutSetting "wikilink")`                    type: POST`\
` `\
` Params: HostName, Key, Value`

` `[`Myth/RemoveStorageGroupDir`](Myth_Service#RemoveStorageGroupDir "wikilink")`         type: POST`\
` `\
` Params: DirName, GroupName, HostName`

` `[`Myth/SendMessage`](Myth_Service#SendMessage "wikilink")`                   type: POST`\
` `\
` Params: Address, Message, Timeout, udpPort`

` `[`Myth/SendNotification`](Myth_Service#SendNotification "wikilink")`              type: POST`\
` `\
` Params: Address, Description, Error, Extra, Fullscreen, Image, Message, `\
`         Origin, Priority, Progress, ProgressText, Timeout, Type, Visibility, `\
`         udpPort`

` `[`Myth/SetConnectionInfo`](Myth_Service#SetConnectionInfo "wikilink")`             type: POST`\
` `\
` Params: DoTest, Host, Name, Password, Port, UserName`

` `[`Myth/Shutdown`](Myth_Service#Shutdown "wikilink")`                      type: POST`\
` `\
` Params: Restart, Retcode`

` `[`Myth/TestDBSettings`](Myth_Service#TestDBSettings "wikilink")`                type: POST`\
` `\
` Params: DBName, HostName, Password, UserName, dbPort`

#### Video service {#video_service}

` `[`Video/AddVideo`](Video_Service#AddVideo "wikilink")`                     type: POST`\
` `\
` Params: FileName, HostName`

` `[`Video/GetBluray`](Video_Service#GetBluray "wikilink")`                    type: GET `\
` `\
` Params: Path`

` `[`Video/GetLastPlayPos`](Video_Service#GetLastPlayPos "wikilink")`               type: GET `\
` `\
` Params: Id`

` `[`Video/GetSavedBookmark`](Video_Service#GetSavedBookmark "wikilink")`             type: GET `\
` `\
` Params: Id`

` `[`Video/GetStreamInfo`](Video_Service#GetStreamInfo "wikilink")`                type: GET `\
` `\
` Params: FileName, StorageGroup`

` `[`Video/GetVideo`](Video_Service#GetVideo "wikilink")`                     type: GET `\
` `\
` Params: Id`

` `[`Video/GetVideoByFileName`](Video_Service#GetVideoByFileName "wikilink")`           type: GET `\
` `\
` Params: FileName`

` `[`Video/GetVideoCommBreak`](Video_Service#GetVideoCommBreak "wikilink")`            type: GET `\
` `\
` Params: Id, OffsetType`

` `[`Video/GetVideoCutList`](Video_Service#GetVideoCutList "wikilink")`              type: GET `\
` `\
` Params: Id, OffsetType`

` `[`Video/GetVideoList`](Video_Service#GetVideoList "wikilink")`                 type: GET `\
` `\
` Params: CollapseSubDirs, Count, Descending, Folder, Sort, StartIndex`

` `[`Video/LookupVideo`](Video_Service#LookupVideo "wikilink")`                  type: GET `\
` `\
` Params: AllowGeneric, Episode, GrabberType, Inetref, Season, Subtitle, `\
`         Title`

` `[`Video/RemoveVideoFromDB`](Video_Service#RemoveVideoFromDB "wikilink")`            type: POST`\
` `\
` Params: Id`

` `[`Video/SetLastPlayPos`](Video_Service#SetLastPlayPos "wikilink")`               type: POST`\
` `\
` Params: Id, Offset`

` `[`Video/SetSavedBookmark`](Video_Service#SetSavedBookmark "wikilink")`             type: POST`\
` `\
` Params: Id, Offset`

` `[`Video/UpdateVideoMetadata`](Video_Service#UpdateVideoMetadata "wikilink")`          type: POST`\
` `\
` Params: Banner, Browse, Cast, Category, ChildID, CollectionRef, ContentType, `\
`         Countries, CoverFile, Director, Episode, Fanart, FileName, Genres, `\
`         Hash, HomePage, Host, Id, Inetref, InsertDate, Length, PlayCommand, `\
`         PlayCount, Plot, Processed, Rating, ReleaseDate, Screenshot, `\
`         Season, ShowLevel, Studio, SubTitle, TagLine, Title, Trailer, `\
`         UserRating, Watched, Year`

` `[`Video/UpdateVideoWatchedStatus`](Video_Service#UpdateVideoWatchedStatus "wikilink")`     type: POST`\
` `\
` Params: Id, Watched`

[Category:Services\_API](Category:Services_API "wikilink")
[Category:Developer\_Documentation](Category:Developer_Documentation "wikilink")
