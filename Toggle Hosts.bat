@echo off
cls

cd C:\WINDOWS\system32\drivers\etc

if exist hosts goto two

:one
ren hosts1 hosts
echo.
echo hosts ENABLED
echo.
goto end

:two
ren hosts hosts1
echo.
echo hosts DISABLED
echo.
goto end

:end
timeout 2
exit