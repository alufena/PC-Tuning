@echo off
chcp 65001 > nul
echo Enabling safe mode...
bcdedit /set {current} safeboot minimal
echo Safe mode will be enabled on the next startup.
echo The computer will shut down in 5 seconds.
echo Press CTRL+C to cancel.
timeout /t 5
shutdown /s /t 0
