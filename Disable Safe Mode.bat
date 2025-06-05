@echo off
chcp 65001 > nul
echo Disabling safe mode...
bcdedit /deletevalue {current} safeboot
echo The system will return to normal mode on the next startup.
pause
