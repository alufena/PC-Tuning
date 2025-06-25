@echo off
setlocal ENABLEEXTENSIONS
set KEY_MOUSE=HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e96f-e325-11ce-bfc1-08002be10318}\0000
set KEY_KEYBD=HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e96b-e325-11ce-bfc1-08002be10318}\0000

echo.
echo ==== FIXING HID DRIVER FOR MOUSE ====
reg query "%KEY_MOUSE%" /v DriverDateData >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Mouse: DriverDateData value not found.
) else (
    for /f "tokens=3,*" %%a in ('reg query "%KEY_MOUSE%" /v DriverDateData') do (
        set "DATA_MOUSE=%%a %%b"
    )
    setlocal enabledelayedexpansion
    set "LASTBYTE=!DATA_MOUSE:~-2!"
    if /i "!LASTBYTE!"=="01" (
        echo [+] Mouse: Last byte is 01. Fixing to 00...
        set "NEWDATA=!DATA_MOUSE:~0,-2!00"
        reg add "%KEY_MOUSE%" /v DriverDateData /t REG_BINARY /d !NEWDATA! /f >nul
        echo [*] Mouse: Value updated successfully.
    ) else (
        echo [-] Mouse: Last byte is not 01. No change made.
    )
    endlocal
)

echo.
echo ==== FIXING HID DRIVER FOR KEYBOARD ====
reg query "%KEY_KEYBD%" /v DriverDateData >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Keyboard: DriverDateData value not found.
) else (
    for /f "tokens=3,*" %%a in ('reg query "%KEY_KEYBD%" /v DriverDateData') do (
        set "DATA_KEYBD=%%a %%b"
    )
    setlocal enabledelayedexpansion
    set "LASTBYTE=!DATA_KEYBD:~-2!"
    if /i "!LASTBYTE!"=="01" (
        echo [+] Keyboard: Last byte is 01. Fixing to 00...
        set "NEWDATA=!DATA_KEYBD:~0,-2!00"
        reg add "%KEY_KEYBD%" /v DriverDateData /t REG_BINARY /d !NEWDATA! /f >nul
        echo [*] Keyboard: Value updated successfully.
    ) else (
        echo [-] Keyboard: Last byte is not 01. No change made.
    )
    endlocal
)

echo.
echo [OK] Operation completed. Please restart the system to apply changes.
timeout /t 2 >nul
exit