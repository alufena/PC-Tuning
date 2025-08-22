sc start "TabletInputService"
sc config "TabletInputService" start= auto
reg delete "HKLM\SYSTEM\CurrentControlSet\Enum\DISPLAY\GSM60B2\5&2adb58f6&1&UID37124\Device Parameters" /v EDID /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Enum\DISPLAY\GSM60B2\5&2adb58f6&2&UID37124\Device Parameters" /v EDID /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\IrisService" /f
reg delete "HKEY_CURRENT_USER\Software\Spoon" /f
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
taskkill /f /t /im crashhelper.exe
taskkill /f /t /im SystemSettingsAdminFlows.exe
taskkill /f /t /im steamerrorreporter.exe
taskkill /f /t /im UnityCrashHandler64.exe
taskkill /f /t /im CrashMailer_64.exe
taskkill /f /t /im EpicOnlineServicesUserHelper.exe
taskkill /f /t /im SndVol.exe
taskkill /f /t /im nvcplui.exe
taskkill /f /t /im EpicWebHelper.exe
taskkill /f /t /im CrashReportClient.exe
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
sc config "WSAIFabricSvc" start= disabled
sc stop "tzautoupdate"
sc config "tzautoupdate" start= disabled
sc config "winmgmt" start= auto
sc config "BTHUSB" start= disabled
::sc start "GraphicsPerfSvc"
bitsadmin.exe /reset /allusers
ie4uinit.exe -ClearIconCache
w32tm /resync
sc stop "UsoSvc"
sc stop "wisvc"
sc stop "BITS"
sc stop "WaaSMedicSvc"
sc stop "cryptsvc"
sc stop "DsmSvc"
sc stop "PushToInstall"
sc stop "LicenseManager"
sc stop "sppsvc"
sc stop "OSRSS"
sc stop "SgrmBroker"
sc stop "SgrmAgent"
powercfg.exe hibernate off
bcdedit /set disabledynamictick Yes
::bcdedit /set disabledynamictick No
::bcdedit /deletevalue disabledynamictick
bcdedit /set hypervisorlaunchtype off
::bcdedit /set hypervisorlaunchtype auto
bcdedit /set tscsyncpolicy enhanced
::bcdedit /set tscsyncpolicy legacy
::bcdedit /deletevalue tscsyncpolicy
bcdedit /set uselegacyapicmode No
::bcdedit /set uselegacyapicmode Yes
::bcdedit /deletevalue uselegacyapicmode
bcdedit /set useplatformclock false
::bcdedit /deletevalue useplatformclock
::bcdedit /set useplatformtick Yes
bcdedit /set useplatformtick No
::bcdedit /deletevalue useplatformtick
::bcdedit /set x2apicpolicy Enable
bcdedit /set x2apicpolicy Disable
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
bcdedit /set disableelamdrivers Yes
::bcdedit /deletevalue disableelamdrivers
bcdedit /set debug No
::bcdedit /deletevalue debug
bcdedit /set ems No
::bcdedit /deletevalue ems
bcdedit /set increaseuserva 268435328
::bcdedit /deletevalue increaseuserva
bcdedit /set isolatedcontext No
::bcdedit /deletevalue isolatedcontext
bcdedit /set linearaddress57 OptOut
::bcdedit /deletevalue linearaddress57
::bcdedit /set maxproc Yes
bcdedit /deletevalue maxproc
bcdedit /set nolowmem Yes
::bcdedit /deletevalue nolowmem
::bcdedit /set numproc 16
bcdedit /deletevalue numproc
bcdedit /set MSI Default
::bcdedit /deletevalue MSI
bcdedit /set onecpu No
::bcdedit /deletevalue onecpu
bcdedit /set quietboot Yes
::bcdedit /deletevalue quietboot
bcdedit /set tpmbootentropy ForceDisable
::bcdedit /deletevalue tpmbootentropy
bcdedit /set usefirmwarepcisettings No
::bcdedit /deletevalue usefirmwarepcisettings
bcdedit /set usephysicaldestination No
::bcdedit /deletevalue usephysicaldestination
bcdedit /set vm no
::bcdedit /deletevalue vm
bcdedit /set vsmlaunchtype Off
::bcdedit /deletevalue vsmlaunchtype
bcdedit /set bootdebug Off
::bcdedit /deletevalue bootdebug
bcdedit /set bootlog No
::bcdedit /deletevalue bootlog
bcdedit /set bootmenupolicy Legacy
::bcdedit /deletevalue bootmenupolicy
bcdedit /set debugstart Disable
::bcdedit /deletevalue debugstart
bcdedit /set extendedinput Yes
::bcdedit /deletevalue extendedinput
bcdedit /set forcefipscrypto No
::bcdedit /deletevalue forcefipscrypto
bcdedit /set halbreakpoint No
::bcdedit /deletevalue halbreakpoint
bcdedit /set highestmode Yes
::bcdedit /deletevalue highestmode
bcdedit /set noumex Yes
::bcdedit /deletevalue noumex
bcdedit /set pae ForceDisable
::bcdedit /set pae ForceEnable
::bcdedit /deletevalue pae
bcdedit /set sos No
::bcdedit /set sos On
::bcdedit /deletevalue sos
bcdedit /set timeout 0
::bcdedit /deletevalue timeout
bcdedit /set restrictapicluster 0 
bcdedit /set pciexpress forcedisable
::bcdedit /deletevalue restrictapicluster
::bcdedit /set testsigning No
::bcdedit /deletevalue testsigning
::bcdedit /set {globalsettings} custom:16000067 true
::bcdedit /set graphicsmodedisabled No
::bcdedit /deletevalue graphicsmodedisabled
::bcdedit /set integrityservices disable
::bcdedit /deletevalue integrityservices
::bcdedit /set firstmegabytepolicy UseAll
::bcdedit /deletevalue firstmegabytepolicy
%windir%\system32\lodctr /R
%windir%\sysWOW64\lodctr /R
C:\Windows\SysWOW64\wbem\winmgmt.exe /RESYNCPERF
C:\Windows\System32\wbem\winmgmt.exe /RESYNCPERF
lodctr /e:PerfOS
taskkill /f /t /im OfficeClickToRun.exe
taskkill /f /t /im ShellHost.exe
wmic process where name="Adobe Crash Processor.exe" CALL terminate
wmic process where name="ctfmon.exe" CALL setpriority 16384
wmic process where name="dllhost.exe" CALL setpriority 64
wmic process where name="dwm.exe" CALL setpriority 64
::wmic process where name="dwm.exe" CALL setpriority 128
::wmic process where name="dwm.exe" CALL setpriority 256
::wmic process where name="dwm.exe" CALL setpriority 32768
wmic process where name="fontdrvhost.exe" CALL setpriority 64
wmic process where name="MoUsoCoreWorker.exe" CALL terminate
wmic process where name="MpDefenderCoreService.exe" CALL terminate
wmic process where name="OfficeClickToRun.exe" CALL terminate
wmic process where name="taskhostw.exe" CALL terminate
wmic process where name="winlogon.exe" CALL setpriority 64
wmic process where name="WmiPrvSvc.exe" CALL terminate
taskkill /f /t /im MoUsoCoreWorker.exe
taskkill /f /t /im RuntimeBroker.exe
taskkill /f /t /im UserOOBEBroker.exe
taskkill /f /t /im WMIADAP.exe
bcdedit /set nx AlwaysOff
::bcdedit /deletevalue nx
bcdedit /deletevalue nointegritychecks
::bcdedit /deletevalue loadoptions
bcdedit /set loadoptions "DISABLE-LSA-ISO,DISABLE-VBS"
powershell -Command "Set-ProcessMitigation -System -Disable DEP,EmulateAtlThunks,ForceRelocateImages,RequireInfo,BottomUp,HighEntropy,StrictHandle,DisableWin32kSystemCalls,AuditSystemCall,DisableExtensionPoints,BlockDynamicCode,AllowThreadsToOptOut,AuditDynamicCode,CFG,SuppressExports,StrictCFG,MicrosoftSignedOnly,AllowStoreSignedBinaries,AuditMicrosoftSigned,AuditStoreSigned,EnforceModuleDependencySigning,DisableNonSystemFonts,AuditFont,BlockRemoteImageLoads,BlockLowLabelImageLoads,PreferSystem32,AuditRemoteImageLoads,AuditLowLabelImageLoads,AuditPreferSystem32,SEHOP,AuditSEHOP,SEHOPTelemetry,TerminateOnError"
taskkill /f /t /im CompPkgSrv.exe
taskkill /f /t /im SearchProtocolHost.exe
taskkill /f /t /im SearchIndexer.exe
taskkill /f /t /im SearchFilterHost.exe
taskkill /f /t /im SearchApp.exe
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -eq 'High precision event timer'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -eq 'Microsoft Device Association Root Enumerator'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -like '*Device Association*'} | Select-Object -ExpandProperty InstanceId"') do (
    pnputil /disable-device "%%i"
)
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object { $_.FriendlyName -like '*PCI Device*' -and $_.Status -eq 'Error' } | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -eq 'Microsoft GS Wavetable Synth'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -like '*RRAS*'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -eq 'Composite Bus Enumerator'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -eq 'Microsoft Virtual Drive Enumerator'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -like '*Remote Desktop*'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -eq 'UMBus Root Bus Enumerator'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -eq 'NDIS Virtual Network Adapter Enumerator'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object { $_.FriendlyName -like '*AMD PSP*' -or $_.FriendlyName -like '*Platform Security Processor*' } | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object { $_.FriendlyName -like '*ISA*Bridge*' } | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object { $_.FriendlyName -like '*RAM Controller*' } | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -eq 'Microsoft System Management BIOS Driver'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -eq 'System Speaker'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -eq 'AMD SMBus'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -Command "Get-PnpDevice | Where-Object {$_.FriendlyName -eq 'Motherboard resources'} | Select-Object -ExpandProperty InstanceId"') do pnputil /disable-device "%%i"
for /f "tokens=*" %%i in ('powershell -NoProfile -Command "Get-PnpDevice -PresentOnly:$false | Where-Object { $_.FriendlyName -eq 'Microsoft Device Association Root Enumerator' } | Select-Object -ExpandProperty InstanceId"') do pnputil /remove-device "%%i"
pnputil /disable-device "ROOT\AMDLOG\0000"
pnputil /disable-device "ROOT\AMDSAFD&FUN_01&REV_01\0000"
pnputil /disable-device "ROOT\KDNIC\0000"
pnputil /disable-device "ROOT\VID\0000"
pnputil /disable-device "SWD\DRIVERENUM\AMDWIN&7&3675a230&0"
pnputil /disable-device "SWD\MSRRAS\{5e259276-bc7e-40e3-b93b-8f89b5f3abc0}"
pnputil /disable-device "SWD\MSRRAS\MS_AGILEVPNMINIPORT"
pnputil /disable-device "SWD\MSRRAS\MS_L2TPMINIPORT"
pnputil /disable-device "SWD\MSRRAS\MS_NDISWANBH"
pnputil /disable-device "SWD\MSRRAS\MS_NDISWANIP"
pnputil /disable-device "SWD\MSRRAS\MS_NDISWANIPV6"
pnputil /disable-device "SWD\MSRRAS\MS_PPPOEMINIPORT"
pnputil /disable-device "SWD\MSRRAS\MS_PPTPMINIPORT"
pnputil /disable-device "SWD\MSRRAS\MS_SSTPMINIPORT"
pnputil /disable-device "SWD\PRINTENUM\{8C9B425C-5DD5-4DC1-AFDE-4EDFD21FFDAE}"
pnputil /disable-device "SWD\PRINTENUM\PrintQueues"
pnputil /disable-device "SWD\RADIO\{3DB5895D-CC28-44B3-AD3D-6F01A782B8D2}"
pnputil /disable-device "SWD\MIDISRV\MIDIU_APP_TRANSPORT"
pnputil /disable-device "SWD\MIDISRV\MIDIU_DIAG_PING"
pnputil /disable-device "SWD\MIDISRV\MIDIU_DIAG_LOOPBACK_B"
pnputil /disable-device "SWD\MIDISRV\MIDIU_DIAG_LOOPBACK_A"
pnputil /disable-device "SWD\MIDISRV\MIDIU_DIAG_TRANSPORT"
::xbox joystick
pnputil /disable-device "USB\VID_045E&PID_028E\20492BE"
::pnputil /enable-device "USB\VID_045E&PID_028E\20492BE"
takeown /f "%SystemRoot%\System32\drivers\Acpidev.sys"
takeown /f "%SystemRoot%\System32\drivers\Acpipagr.sys"
takeown /f "%SystemRoot%\System32\drivers\Acpitime.sys"
takeown /f "%SystemRoot%\System32\drivers\Acpipmi.sys"
icacls "%SystemRoot%\System32\drivers\Acpidev.sys" /grant %username%:F
icacls "%SystemRoot%\System32\drivers\Acpipagr.sys" /grant %username%:F
icacls "%SystemRoot%\System32\drivers\Acpitime.sys" /grant %username%:F
icacls "%SystemRoot%\System32\drivers\Acpipmi.sys" /grant %username%:F
del /f /q "%SystemRoot%\System32\drivers\Acpidev.sys"
del /f /q "%SystemRoot%\System32\drivers\Acpipagr.sys"
del /f /q "%SystemRoot%\System32\drivers\Acpitime.sys"
del /f /q "%SystemRoot%\System32\drivers\Acpipmi.sys"
takeown /f "C:\Windows\System32\mcupdate_GenuineIntel.dll"
takeown /f "C:\Windows\System32\mcupdate_AuthenticAMD.dll"
icacls "%SystemRoot%\System32\mcupdate_GenuineIntel.dll" /grant %username%:F
icacls "%SystemRoot%\System32\mcupdate_AuthenticAMD.dll" /grant %username%:F
del "C:\Windows\System32\mcupdate_GenuineIntel.dll"
del "C:\Windows\System32\mcupdate_AuthenticAMD.dll"
takeown /f "C:\Windows\System32\GameBarPresenceWriter.exe"
takeown /f "C:\Windows\System32\GameBarPresenceWriter.proxy.dll"
takeown /f "C:\Windows\System32\Windows.Gaming.UI.GameBar.dll"
icacls "%SystemRoot%\System32\GameBarPresenceWriter.exe" /grant %username%:F
icacls "%SystemRoot%\System32\GameBarPresenceWriter.proxy.dll" /grant %username%:F
icacls "%SystemRoot%\System32\Windows.Gaming.UI.GameBar.dll" /grant %username%:F
del "C:\Windows\System32\GameBarPresenceWriter.exe"
del "C:\Windows\System32\GameBarPresenceWriter.proxy.dll"
del "C:\Windows\System32\Windows.Gaming.UI.GameBar.dll"
takeown /f "%SystemRoot%\System32\spool\drivers\color" /r /d y >nul
icacls "%SystemRoot%\System32\spool\drivers\color" /grant Administrators:F /t >nul
del /f /s /q "%SystemRoot%\System32\spool\drivers\color\*.*" >nul
for /D %%D in ("%SystemRoot%\System32\spool\drivers\color\*") do rmdir /s /q "%%D"
takeown /f "%WinDir%\HelpPane.exe"
icacls "%WinDir%\HelpPane.exe" /deny Everyone:(X)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /va /f
reg delete "HKCU\Software\Microsoft\Direct3D\MostRecentApplication" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\MostRecentApplication" /va /f
reg delete "HKCU\Software\Microsoft\MediaPlayer\Player\RecentFileList" /va /f
reg delete "HKCU\Software\Microsoft\MediaPlayer\Player\RecentURLList" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\MediaPlayer\Player\RecentFileList" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\MediaPlayer\Player\RecentURLList" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU" /va /f
reg delete "HKCU\Software\Microsoft\Search Assistant\ACMru" /va /f
reg delete "HKCU\Software\Adobe\MediaBrowser\MRU" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List" /va /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Wbem\WDM" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Wbem\WDM\DREDGE" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\FTH\State" /va /f
wusa.exe /uninstall /kb:5063878 /quiet /norestart
wusa.exe /uninstall /kb:5063875 /quiet /norestart
wusa.exe /uninstall /kb:5063709 /quiet /norestart
wusa.exe /uninstall /kb:5063877 /quiet /norestart
wusa.exe /uninstall /kb:5063871 /quiet /norestart
wusa.exe /uninstall /kb:5063889 /quiet /norestart
wusa.exe /uninstall /kb:5062660 /quiet /norestart
for %K in (5063878 5063875 5063709 5063877 5063871 5063889 5062660) do for /f "tokens=*" %P in ('dism /online /get-packages ^| findstr %K') do dism /online /remove-package /packagename:%P /quiet /norestart
::timeout /t 8 /nobreak
winget uninstall "windows web experience pack"
winget uninstall --id Microsoft.WindowsWebExperiencePack
taskkill /f /t /im node.exe
taskkill /f /t /im powershell.exe
taskkill /f /t /im conhost.exe
taskkill /f /t /im cmd.exe
exit
