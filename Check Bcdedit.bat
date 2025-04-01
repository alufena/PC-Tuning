@echo off
cls

echo Verificando disabledynamictick...
bcdedit /enum {current} | findstr /i "disabledynamictick"

echo.
echo Verificando tscsyncpolicy...
bcdedit /enum {current} | findstr /i "tscsyncpolicy"

echo.
echo Verificando uselegacyapicmode...
bcdedit /enum {current} | findstr /i "uselegacyapicmode"

echo.
echo Verificando useplatformclock...
bcdedit /enum {current} | findstr /i "useplatformclock"

echo.
echo Verificando useplatformtick...
bcdedit /enum {current} | findstr /i "useplatformtick"

echo.
echo Verificando x2apicpolicy...
bcdedit /enum {current} | findstr /i "x2apicpolicy"

echo.
echo Verificando hypervisorlaunchtype...
bcdedit /enum {current} | findstr /i "hypervisorlaunchtype"

echo.
echo Verificacao concluida.
pause