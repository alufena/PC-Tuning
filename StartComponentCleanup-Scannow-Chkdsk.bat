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
netsh winsock reset
netsh winsock reset proxy
regsvr32.exe /s atl.dll
regsvr32.exe /s urlmon.dll
regsvr32.exe /s mshtml.dll
regsvr32.exe /s quartz.dll
rundll32.exe pnpclean.dll,RunDLL_PnpClean /drivers/maxclean
vssadmin delete shadows /for=c: /all /quiet
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /RestoreHealth
DISM /Online /Cleanup-Image /StartComponentCleanup
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
DISM /Online /Cleanup-Image /StartComponentCleanup /SPSuperseded
DISM /Online /Cleanup-Image /AnalyzeComponentStore
DISM /Online /Set-ReservedStorageState /State:Disabled
dism.exe /online /disable-feature /FeatureName:recall /noRestart
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
taskkill /f /t /im conhost.exe
taskkill /f /t /im cmd.exe
exit
