@echo off
cls

echo Checking disabledynamictick...
bcdedit /enum {current} | findstr /i "disabledynamictick"

echo.
echo Checking tscsyncpolicy...
bcdedit /enum {current} | findstr /i "tscsyncpolicy"

echo.
echo Checking uselegacyapicmode...
bcdedit /enum {current} | findstr /i "uselegacyapicmode"

echo.
echo Checking useplatformclock...
bcdedit /enum {current} | findstr /i "useplatformclock"

echo.
echo Checking useplatformtick...
bcdedit /enum {current} | findstr /i "useplatformtick"

echo.
echo Checking x2apicpolicy...
bcdedit /enum {current} | findstr /i "x2apicpolicy"

echo.
echo Checking hypervisorlaunchtype...
bcdedit /enum {current} | findstr /i "hypervisorlaunchtype"

echo.
echo Check completed.
pause
