sc start "TabletInputService"
sc config "TabletInputService" start= auto
taskkill /f /t /im acrotray.exe
taskkill /f /t /im adb.exe
taskkill /f /t /im AdobeIPCBroker.exe
taskkill /f /t /im Agent.exe
taskkill /f /t /im ai.exe
taskkill /f /t /im ApplicationFrameHost.exe
taskkill /f /t /im AppVShNotify.exe
taskkill /f /t /im armsvc.exe
taskkill /f /t /im backgroundTaskHost.exe
taskkill /f /t /im CalculatorApp.exe
taskkill /f /t /im calculator.exe
taskkill /f /t /im CCLibrary.exe
taskkill /f /t /im CCXProcess.exe
taskkill /f /t /im CEPHtmlEngine.exe
taskkill /f /t /im cfbackd.w32.exe
taskkill /f /t /im CHXSmartScreen.exe
taskkill /f /t /im CompPkgSrv.exe
taskkill /f /t /im CoreSync.exe
taskkill /f /t /im CrashMailer_64.exe
taskkill /f /t /im DashboardNotificationManager.exe
taskkill /f /t /im DataExchangeHost.exe
taskkill /f /t /im EABackgroundService.exe
taskkill /f /t /im fdm.exe
taskkill /f /t /im FESearchHost.exe
taskkill /f /t /im FileCoAuth.exe
taskkill /f /t /im gamebar.exe
taskkill /f /t /im GameBarPresenceWriter.exe
taskkill /f /t /im GameInputSvc.exe
taskkill /f /t /im GameManagerService.exe
taskkill /f /t /im helperservice.exe
taskkill /f /t /im HelpPane.exe
taskkill /f /t /im hxaccounts.exe
taskkill /f /t /im hxoutlook.exe
taskkill /f /t /im HxTsr.exe
taskkill /f /t /im JackettConsole.exe
taskkill /f /t /im jcef_helper.exe
taskkill /f /t /im lockapp.exe
taskkill /f /t /im memBoost.exe
taskkill /f /t /im MicrosoftEdgeUpdate.exe
taskkill /f /t /im microsoft.photos.exe
taskkill /f /t /im MpCmdRun.exe
taskkill /f /t /im msedgewebview2.exe
taskkill /f /t /im msiexec.exe
taskkill /f /t /im NVDisplay.Container.exe
taskkill /f /t /im OSE.exe
taskkill /f /t /im PerfWatson2.exe
taskkill /f /t /im PhoneExperienceHost.exe
taskkill /f /t /im PhotosService.exe
taskkill /f /t /im "Razer Central.exe"
taskkill /f /t /im "RazerCentralService.exe"
taskkill /f /t /im "Razer Synapse 3.exe"
taskkill /f /t /im "Razer Synapse Service.exe"
taskkill /f /t /im "Razer Synapse Service Process.exe"
taskkill /f /t /im RtkAudUService64.exe
taskkill /f /t /im RtkNGUI64.exe
taskkill /f /t /im rundll32.exe
taskkill /f /t /im SDXHelper.exe
taskkill /f /t /im searchhost.exe
taskkill /f /t /im SecurityHealthHost.exe
taskkill /f /t /im SecurityHealthService.exe
taskkill /f /t /im SelectiveToolApp.exe
taskkill /f /t /im set-up.exe
taskkill /f /t /im smartscreen.exe
taskkill /f /t /im smss.exe
taskkill /f /t /im SnippingTool.exe
taskkill /f /t /im splwow64.exe
taskkill /f /t /im spoolsv.exe
taskkill /f /t /im sppsvc.exe
taskkill /f /t /im sqlwriter.exe
taskkill /f /t /im ssh-agent.exe
taskkill /f /t /im ssh.exe
taskkill /f /t /im startmenuexperiencehost.exe
taskkill /f /t /im SystemSettingsBroker.exe
taskkill /f /t /im TabTip.exe
taskkill /f /t /im textinputhost.exe
taskkill /f /t /im TiWorker.exe
taskkill /f /t /im TrustedInstaller.exe
taskkill /f /t /im uhssvc.exe
taskkill /f /t /im vds.exe
taskkill /f /t /im video.ui.exe
taskkill /f /t /im vssadmin.exe
taskkill /f /t /im VSSVC.exe
taskkill /f /t /im werfault.exe
taskkill /f /t /im WidgetService.exe
taskkill /f /t /im Widgets.exe
taskkill /f /t /im WindowsPackageManagerServer.exe
taskkill /f /t /im winstore.app.exe
taskkill /f /t /im WmiApSrv.exe
taskkill /f /t /im WmiPrvSE.exe
taskkill /f /t /im WUDFHost.exe
taskkill /f /t /im yourphone.exe
sc start "SysMain"
::sc stop "SysMain"
sc config "SysMain" start= auto
::sc config "SysMain" start= disabled
sc config "wlidsvc" start= auto
sc stop "ClickToRunSvc"
sc config "ClickToRunSvc" start= manual
sc stop "BcastDVRUserService"
sc config "BcastDVRUserService" start= disabled
sc stop "XboxGipSvc"
sc config "XboxGipSvc" start= disabled
sc stop "edgeupdate"
sc config "edgeupdate" start= disabled
sc stop "edgeupdatem"
sc config "edgeupdatem" start= disabled
sc stop "NPSMSvc"
sc config "NPSMSvc" start= disabled
sc stop "OneSyncSvc"
sc config "OneSyncSvc" start= disabled
sc stop "DusmSvc"
sc config "DusmSvc" start= disabled
sc stop "DoSvc"
sc config "DoSvc" start= disabled
sc stop "DPS"
sc config "DPS" start= disabled
sc stop "RmSvc"
sc config "RmSvc" start= disabled
sc stop "LanmanWorkstation"
sc config "LanmanWorkstation" start= disabled
sc stop "cfbackd"
sc config "cfbackd" start= disabled
sc stop "GameInputSvc"
sc config "GameInputSvc" start= disabled
sc stop "AxInstSV"
sc config "AxInstSV" start= disabled
sc stop "bthserv"
sc config "bthserv" start= disabled
sc stop "PimIndexMaintenanceSvc"
sc config "PimIndexMaintenanceSvc" start= disabled
sc stop "dmwappushservice"
sc config "dmwappushservice" start= disabled
sc stop "AppVClient"
sc config "AppVClient" start= disabled
sc stop "NetTcpPortSharing"
sc config "NetTcpPortSharing" start= disabled
sc stop "SSDPSRV"
sc config "SSDPSRV" start= disabled
sc stop "BluetoothUserService"
sc config "BluetoothUserService" start= disabled
sc stop "WSearch"
sc config "WSearch" start= disabled
sc stop "NVDisplay.ContainerLocalSystem"
sc config "NVDisplay.ContainerLocalSystem" start= disabled
sc stop "WdiServiceHost"
sc config "WdiServiceHost" start= disabled
sc stop "WdiSystemHost"
sc config "WdiSystemHost" start= disabled
sc stop "DiagTrack"
sc config "DiagTrack" start= disabled
sc stop "SecurityHealthService"
sc config "SecurityHealthService" start= disabled
sc stop "webthreatdefsvc"
sc config "webthreatdefsvc" start= disabled
sc stop "WinHttpAutoProxySvc"
sc config "WinHttpAutoProxySvc" start= disabled
sc stop "webthreatdefusersvc"
sc config "webthreatdefusersvc" start= disabled
sc stop "wcncsvc"
sc config "wcncsvc" start= disabled
sc stop "TrkWks"
sc config "TrkWks" start= disabled
sc stop "iphlpsvc"
sc config "iphlpsvc" start= disabled
sc stop "lmhosts"
sc config "lmhosts" start= disabled
sc stop "RasMan"
sc config "RasMan" start= disabled
sc stop "FontCache"
sc config "FontCache" start= disabled
sc stop "PcaSvc"
sc config "PcaSvc" start= disabled
sc stop "UCPD"
sc config "UCPD" start= disabled
sc stop "XblAuthManager"
sc config "XblAuthManager" start= disabled
sc stop "XblGameSave"
sc config "XblGameSave" start= disabled
sc stop "XboxNetApiSvc"
sc config "XboxNetApiSvc" start= disabled
sc stop "DevQueryBroker"
sc config "DevQueryBroker" start= disabled
sc stop "EFS"
sc config "EFS" start= disabled
sc stop "FileSyncHelper"
sc config "FileSyncHelper" start= disabled
sc stop "fdPHost"
sc config "fdPHost" start= disabled
sc stop "HasleoImageMountService"
sc config "HasleoImageMountService" start= disabled
sc stop "HasleoBackupSuiteService"
sc config "HasleoBackupSuiteService" start= disabled
sc stop "HvHost"
sc config "HvHost" start= disabled
sc stop "IKEEXT"
sc config "IKEEXT" start= disabled
sc stop "InventorySvc"
sc config "InventorySvc" start= disabled
sc stop "PolicyAgent"
sc config "PolicyAgent" start= disabled
sc stop "diagnosticshub.standardcollector.service"
sc config "diagnosticshub.standardcollector.service" start= disabled
sc stop "SEMgrSvc"
sc config "SEMgrSvc" start= disabled
sc stop "WPDBusEnum"
sc config "WPDBusEnum" start= disabled
sc stop "Spooler"
sc config "Spooler" start= disabled
sc stop "TermService"
sc config "TermService" start= disabled
sc stop "RetailDemo"
sc config "RetailDemo" start= disabled
sc stop "QWAVE"
sc config "QWAVE" start= disabled
sc stop "SstpSvc"
sc config "SstpSvc" start= disabled
sc stop "ShellHWDetection"
sc config "ShellHWDetection" start= disabled
sc stop "WebClient"
sc config "WebClient" start= disabled
sc stop "WbioSrvc"
sc config "WbioSrvc" start= disabled
sc stop "StiSvc"
sc config "StiSvc" start= disabled
sc stop "WinRM"
sc config "WinRM" start= disabled
sc stop "W32Time"
sc config "W32Time" start= disabled
sc stop "RemoteRegistry"
sc config "RemoteRegistry" start= disabled
sc stop "Themes"
sc config "Themes" start= disabled
sc stop "pla"
sc config "pla" start= disabled
sc stop "BthAvctpSvc"
sc config "BthAvctpSvc" start= disabled
sc stop "Dnscache"
sc config "Dnscache" start= disabled
sc stop "KtmRm"
sc config "KtmRm" start= disabled
sc stop "WSAIFabricSvc"
sc config WSAIFabricSvc start= disabled
sc config winmgmt start= auto
net start GraphicsPerfSvc
ie4uinit.exe -ClearIconCache
powercfg.exe hibernate off
reg delete "HKEY_CURRENT_USER\Software\Spoon" /f
bcdedit /set disabledynamictick Yes
::bcdedit /set disabledynamictick No
::bcdedit /deletevalue disabledynamictick
bcdedit /set hypervisorlaunchtype off
::bcdedit /set hypervisorlaunchtype auto
bcdedit /set tscsyncpolicy enhanced
::bcdedit /set tscsyncpolicy legacy
::bcdedit /deletevalue tscsyncpolicy
bcdedit /set uselegacyapicmode No
::bcdedit /deletevalue uselegacyapicmode
bcdedit /set useplatformclock false
::bcdedit /deletevalue useplatformclock
bcdedit /set useplatformtick Yes
::bcdedit /set useplatformtick No
::bcdedit /deletevalue useplatformtick
bcdedit /set x2apicpolicy Enable
::bcdedit /set x2apicpolicy Disable
::bcdedit /deletevalue x2apicpolicy
bcdedit /set allowedinmemorysettings 0x0
::bcdedit /deletevalue allowedinmemorysettings
bcdedit /set avoidlowmemory 0x8000000
::bcdedit /deletevalue avoidlowmemory
bcdedit /set bootems No
::bcdedit /deletevalue bootems
bcdedit /set bootux Disabled
::bcdedit /deletevalue bootux
bcdedit /set configaccesspolicy Default
::bcdedit /deletevalue configaccesspolicy
bcdedit /set debug No
::bcdedit /deletevalue debug
bcdedit /set disableelamdrivers Yes
::bcdedit /deletevalue disableelamdrivers
bcdedit /set ems No
::bcdedit /deletevalue ems
bcdedit /set firstmegabytepolicy UseAll
::bcdedit /deletevalue firstmegabytepolicy
bcdedit /set increaseuserva 268435328
::bcdedit /deletevalue increaseuserva
bcdedit /set integrityservices disable
::bcdedit /deletevalue integrityservices
bcdedit /set isolatedcontext No
::bcdedit /deletevalue isolatedcontext
bcdedit /set linearaddress57 OptOut
::bcdedit /deletevalue linearaddress57
bcdedit /set maxproc yes
::bcdedit /deletevalue maxproc
bcdedit /set MSI Default
::bcdedit /deletevalue MSI
bcdedit /set nolowmem Yes
::bcdedit /deletevalue nolowmem
bcdedit /set numproc 16
::bcdedit /deletevalue numproc
bcdedit /set onecpu No
::bcdedit /deletevalue onecpu
bcdedit /set quietboot yes
::bcdedit /deletevalue quietboot
bcdedit /set tpmbootentropy ForceDisable
::bcdedit /deletevalue tpmbootentropy
bcdedit /set usefirmwarepcisettings No
::bcdedit /deletevalue usefirmwarepcisettings
bcdedit /set usephysicaldestination No
::bcdedit /deletevalue usephysicaldestination
bcdedit /set vm no
::bcdedit /deletevalue vm
bcdedit /set vsmlaunchtype off
::bcdedit /deletevalue vsmlaunchtype
::bcdedit /set bootdebug Off
bcdedit /bootdebug Off
::bcdedit /deletevalue /bootdebug
bdedit /bootems Off
::bcdedit /deletevalue /bootems
bcdedit /debug Off
::bcdedit /debug On
bcdedit /ems Off
::bcdedit /deletevalue /ems
bcdedit /set bootlog No
::bcdedit /deletevalue /bootlog
bcdedit /set bootmenupolicy Legacy
::bcdedit /deletevalue /bootmenupolicy
bcdedit /set debugstart Disable
::bcdedit /deletevalue /debugstart
bcdedit /set extendedinput Yes
::bcdedit /deletevalue /extendedinput
bcdedit /set forcefipscrypto No
::bcdedit /deletevalue /forcefipscrypto
::bcdedit /set {globalsettings} custom:16000067 true
::bcdedit /set graphicsmodedisabled No
bcdedit /deletevalue graphicsmodedisabled
bcdedit /set halbreakpoint No
::bcdedit /deletevalue halbreakpoint
bcdedit /set highestmode Yes
::bcdedit /deletevalue highestmode
bcdedit /set noumex Yes
::bcdedit /deletevalue noumex
bcdedit /set pae ForceEnable
::bcdedit /deletevalue pae
bcdedit /set sos On
::bcdedit /deletevalue sos
bcdedit /timeout 0
::bcdedit /deletevalue timeout
%windir%\system32\lodctr /R
%windir%\sysWOW64\lodctr /R
C:\Windows\SysWOW64\wbem\winmgmt.exe /RESYNCPERF
C:\Windows\System32\wbem\winmgmt.exe /RESYNCPERF
lodctr /e:PerfOS
taskkill /f /t /im OfficeClickToRun.exe
taskkill /f /t /im ShellHost.exe
wmic process where name="Adobe Crash Processor.exe" CALL terminate
wmic process where name="MoUsoCoreWorker.exe" CALL terminate
wmic process where name="MpDefenderCoreService.exe" CALL terminate
wmic process where name="OfficeClickToRun.exe" CALL terminate
wmic process where name="taskhostw.exe" CALL terminate
wmic process where name="WmiPrvSvc.exe" CALL terminate
wmic process where name="dwm.exe" CALL setpriority 32768
::wmic process where name="dwm.exe" CALL setpriority 64
wmic process where name="dllhost.exe" CALL setpriority 64
wmic process where name="fontdrvhost.exe" CALL setpriority 64
wmic process where name="winlogon.exe" CALL setpriority 64
taskkill /f /t /im MoUsoCoreWorker.exe
taskkill /f /t /im RuntimeBroker.exe
taskkill /f /t /im UserOOBEBroker.exe
taskkill /f /t /im WMIADAP.exe
bcdedit /set nx AlwaysOff
powershell -Command "Set-ProcessMitigation -System -Disable DEP,EmulateAtlThunks,ForceRelocateImages,RequireInfo,BottomUp,HighEntropy,StrictHandle,DisableWin32kSystemCalls,AuditSystemCall,DisableExtensionPoints,BlockDynamicCode,AllowThreadsToOptOut,AuditDynamicCode,CFG,SuppressExports,StrictCFG,MicrosoftSignedOnly,AllowStoreSignedBinaries,AuditMicrosoftSigned,AuditStoreSigned,EnforceModuleDependencySigning,DisableNonSystemFonts,AuditFont,BlockRemoteImageLoads,BlockLowLabelImageLoads,PreferSystem32,AuditRemoteImageLoads,AuditLowLabelImageLoads,AuditPreferSystem32,SEHOP,AuditSEHOP,SEHOPTelemetry,TerminateOnError"
bcdedit /deletevalue nointegritychecks
bcdedit /deletevalue loadoptions
::bcdedit /debug off
::bcdedit /deletevalue nx
taskkill /f /t /im CompPkgSrv.exe
reg delete "HKLM\SYSTEM\CurrentControlSet\Enum\DISPLAY\GSM60B2\5&2adb58f6&0&UID37124\Device Parameters" /v EDID /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\IrisService" /f
w32tm /resync
taskkill /f /t /im SearchProtocolHost.exe
taskkill /f /t /im SearchIndexer.exe
taskkill /f /t /im SearchFilterHost.exe
taskkill /f /t /im SearchApp.exe
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-PnpDevice -FriendlyName 'High precision event timer' | Disable-PnpDevice -Confirm:$false"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-PnpDevice -FriendlyName 'Microsoft Device Association Root Enumerator' -ErrorAction SilentlyContinue | Disable-PnpDevice -Confirm:$false -ErrorAction SilentlyContinue"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$devices = Get-PnpDevice | Where-Object {$_.FriendlyName -like '*Device Association*'}; foreach ($device in $devices) { try { pnputil /remove-device $device.InstanceId; Start-Sleep -Seconds 1; pnputil /remove-device $device.InstanceId /force; } catch {} }"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-PnpDevice -FriendlyName 'Microsoft GS Wavetable Synth' | Disable-PnpDevice -Confirm:$false"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$device = Get-PnpDevice | Where-Object {$_.FriendlyName -like '*RRAS*'}; if ($device) { $device | Disable-PnpDevice -Confirm:$false }"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-PnpDevice -FriendlyName 'Composite Bus Enumerator' | Disable-PnpDevice -Confirm:$false"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-PnpDevice -FriendlyName 'Microsoft Virtual Drive Enumerator' | Disable-PnpDevice -Confirm:$false"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$device = Get-PnpDevice | Where-Object {$_.FriendlyName -like '*Remote Desktop*'}; if ($device) { try { $device | Disable-PnpDevice -Confirm:$false -ErrorAction SilentlyContinue } catch {} }"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-PnpDevice -FriendlyName 'UMBus Root Bus Enumerator' | Disable-PnpDevice -Confirm:$false"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-PnpDevice -FriendlyName 'NDIS Virtual Network Adapter Enumerator' | Disable-PnpDevice -Confirm:$false"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$device = Get-PnpDevice | Where-Object {$_.FriendlyName -like '*AMD PSP*' -or $_.FriendlyName -like '*Platform Security Processor*'}; if ($device) { try { $device | Disable-PnpDevice -Confirm:$false -ErrorAction SilentlyContinue } catch {} }"
::timeout /t 8 /nobreak
taskkill /f /t /im node.exe
taskkill /f /t /im powershell.exe
taskkill /f /t /im conhost.exe
taskkill /f /t /im cmd.exe
exit
