SC config trustedinstaller start=auto
chkdsk /scan
::chkdsk c: /sdcleanup /offlinescanandfix
::chkdsk c: /f /r /x /b
::net stop bits
net stop wuauserv
net stop msiserver
::net stop cryptsvc
net stop appidsvc
net stop winmgmt
::net stop pla
Ren %Systemroot%\SoftwareDistribution SoftwareDistribution.old
Ren %Systemroot%\System32\catroot2 catroot2.old
netsh winsock reset
netsh winsock reset proxy
regsvr32.exe /s atl.dll
regsvr32.exe /s urlmon.dll
regsvr32.exe /s mshtml.dll
rundll32.exe pnpclean.dll,RunDLL_PnpClean /DRIVERS /MAXCLEAN
vssadmin delete shadows /for=c: /all /quiet
::DISM /Online /Cleanup-Image /ScanHealth
::DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /RestoreHealth
DISM /Online /Cleanup-Image /StartComponentCleanup
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
DISM /Online /Cleanup-Image /StartComponentCleanup /SPSuperseded
DISM /Online /Cleanup-Image /AnalyzeComponentStore
DISM /Online /Set-ReservedStorageState /State:Disabled
dism.exe /online /disable-feature /FeatureName:recall /noRestart
dism.exe /online /disable-feature:MediaPlayback
dism.exe /online /disable-feature:SearchEngine-Client-Package
dism.exe /online /disable-feature:Windows-Defender-Default-Definitions
dism.exe /online /disable-feature:WindowsMediaPlayer
dism.exe /online /Remove-Capability /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0
dism.exe /online /Remove-Capability /CapabilityName:Media.WindowsMediaPlayer~~~~0.0.12.0
dism.exe /online /disable-feature:Internet-Explorer-Optional-amd64
DISM /Cleanup-Wim
DISM /Cleanup-Mountpoints
sfc /scannow
::net start bits
net start wuauserv
net start msiserver
::net start cryptsvc
net start appidsvc
net start winmgmt
::net start pla
bcdedit /deletevalue nointegritychecks
bcdedit /deletevalue loadoptions
bcdedit /debug off
::bcdedit /deletevalue nx
fsutil usn deletejournal /d /n c:
winmgmt /salvagerepository
taskkill /f /t /im msiexec.exe
taskkill /f /t /im CompPkgSrv.exe
taskkill /f /t /im TiWorker.exe
taskkill /f /t /im TrustedInstaller.exe
taskkill /f /t /im MoUsoCoreWorker.exe
takeown /f %SystemRoot%\System32\drivers\Acpidev.sys
takeown /f %SystemRoot%\System32\drivers\Acpipagr.sys
takeown /f %SystemRoot%\System32\drivers\Acpitime.sys
takeown /f %SystemRoot%\System32\drivers\Acpipmi.sys
icacls %SystemRoot%\System32\drivers\Acpidev.sys /grant %username%:F
icacls %SystemRoot%\System32\drivers\Acpipagr.sys /grant %username%:F
icacls %SystemRoot%\System32\drivers\Acpitime.sys /grant %username%:F
icacls %SystemRoot%\System32\drivers\Acpipmi.sys /grant %username%:F
del /f /q %SystemRoot%\System32\drivers\Acpidev.sys
del /f /q %SystemRoot%\System32\drivers\Acpipagr.sys
del /f /q %SystemRoot%\System32\drivers\Acpitime.sys
del /f /q %SystemRoot%\System32\drivers\Acpipmi.sys
taskkill /f /t /im conhost.exe
taskkill /f /t /im cmd.exe
exit
