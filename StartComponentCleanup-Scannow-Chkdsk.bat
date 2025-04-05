SC config trustedinstaller start=auto
chkdsk /scan
net stop bits
net stop wuauserv
net stop msiserver
net stop cryptsvc
net stop appidsvc
net stop winmgmt
net stop pla
Ren %Systemroot%\SoftwareDistribution SoftwareDistribution.old
Ren %Systemroot%\System32\catroot2 catroot2.old
netsh winsock reset
netsh winsock reset proxy
regsvr32.exe /s atl.dll
regsvr32.exe /s urlmon.dll
regsvr32.exe /s mshtml.dll
rundll32.exe pnpclean.dll,RunDLL_PnpClean /DRIVERS /MAXCLEAN
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
net start bits
net start wuauserv
net start msiserver
net start cryptsvc
net start appidsvc
net start winmgmt
net start pla
bcdedit /deletevalue nointegritychecks
bcdedit /deletevalue loadoptions
bcdedit /debug off
::bcdedit /deletevalue nx
fsutil usn deletejournal /d /n c:
winmgmt /salvagerepository
taskkill /f /im msiexec.exe
taskkill /f /im CompPkgSrv.exe
taskkill /f /im TiWorker.exe
taskkill /f /im TrustedInstaller.exe
taskkill /f /im conhost.exe
timeout /t 20 /nobreak
exit
