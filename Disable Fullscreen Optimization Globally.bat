@echo off
setlocal EnabledelayedExpansion

:: Run Batch as Admin
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Disable Fullscreenoptimization globally
:: https://docs.microsoft.com/de-de/windows/deployment/planning/compatibility-fixes-for-windows-8-windows-7-and-windows-vista

:: This will get added to systemvariables
setx __COMPAT_LAYER "DISABLEDXMAXIMIZEDWINDOWEDMODE DISABLEFADEANIMATIONS NOSHADOW NOPADDEDBORDER NOGHOST DISABLEANIMATION DISABLETHEMES DISABLETHEMEMENUS DISABLEDWM PERPROCESSSYSTEMDPIFORCEOFF HIGHDPIAWARE" /m

exit