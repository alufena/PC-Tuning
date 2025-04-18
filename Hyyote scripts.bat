@echo off
setlocal EnableDelayedExpansion

POWERSHELL "ForEach($v in (Get-Command -Name \"Set-ProcessMitigation\").Parameters[\"Disable\"].Attributes.ValidValues){Set-ProcessMitigation -System -Disable $v.ToString() -ErrorAction SilentlyContinue}"  >NUL 2>&1

ECHO Disabling IoLatencyCap...
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services" /S /F "IoLatencyCap"^| FINDSTR /V "IoLatencyCap"') DO (
    REG ADD "%%a" /v "IoLatencyCap" /t REG_DWORD /d "0" /f >NUL 2>&1
    FOR /F "tokens=*" %%z IN ("%%a") DO (
        SET STR=%%z
        SET STR=!STR:HKLM\System\CurrentControlSet\services\=!
        SET STR=!STR:\Parameters=!
    )
)

ECHO Disabling HIPM and DIPM...
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services" /S /F "EnableHIPM"^| FINDSTR /V "EnableHIPM"') DO (
    REG ADD "%%a" /v "EnableHIPM" /t REG_DWORD /d "0" /f >NUL 2>&1
    REG ADD "%%a" /v "EnableDIPM" /t REG_DWORD /d "0" /f >NUL 2>&1
    FOR /F "tokens=*" %%z IN ("%%a") DO (
        SET STR=%%z
        SET STR=!STR:HKLM\System\CurrentControlSet\Services\=!
    )
)

ECHO Removing adapters off QoS Service...
FOR /F %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services\Psched\Parameters\Adapters"') DO (
    REG DELETE %%a /F >NUL 2>&1
    FOR /F "tokens=*" %%z IN ("%%a") DO (
        SET STR=%%z
        SET STR=!STR:HKLM\System\CurrentControlSet\Services\Psched\Parameters\Adapters\=!
    )
)

ECHO Disabling QoS and NdisCap...
FOR /F "tokens=3*" %%I IN ('REG QUERY "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkCards" /F "ServiceName" /S^| FINDSTR /I /L "ServiceName"') DO (
    FOR /F %%a IN ('REG QUERY "HKLM\System\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}" /F "%%I" /D /E /S^| FINDSTR /I /L "\\Class\\"') DO SET "REGPATH=%%a"
    FOR /F "tokens=3*" %%n in ('REG QUERY "!REGPATH!" /V "FilterList"') DO SET newFilterList=%%n
    SET newFilterList=!newFilterList:-{B5F4D659-7DAA-4565-8E41-BE220ED60542}=!
    SET newFilterList=!newFilterList:-{430BDADD-BAB0-41AB-A369-94B67FA5BE0A}=!
    REG QUERY !REGPATH! /V "FilterList" | FINDSTR /I "{B5F4D659-7DAA-4565-8E41-BE220ED60542} {430BDADD-BAB0-41AB-A369-94B67FA5BE0A}" >NUL 2>&1
    IF NOT ERRORLEVEL 1 (
        REG ADD !REGPATH! /F /V "FilterList" /T REG_MULTI_SZ /d "!newFilterList!" >NUL 2>&1
    )
)

ECHO Disabling USB Hub idle...
FOR /F %%a in ('WMIC PATH Win32_USBHub GET DeviceID^| FINDSTR /L "VID_"') DO (
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f >NUL 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f >NUL 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "SelectiveSuspendOn" /t REG_DWORD /d "0" /f >NUL 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D1Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D2Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D3Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D1Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D2Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
    REG ADD "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D3Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
)

ECHO Disabling StorPort idle...
FOR /F "tokens=*" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Enum" /S /F "StorPort"^| FINDSTR /E "StorPort"') DO (
    REG ADD "%%a" /v "EnableIdlePowerManagement" /t REG_DWORD /d "0" /f >NUL 2>&1
    FOR /F "tokens=*" %%z IN ("%%a") DO (
        SET STR=%%z
        SET STR=!STR:HKLM\System\CurrentControlSet\Enum\=!
        SET STR=!STR:\Device Parameters\StorPort=!
    )
)

REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "1" /f >NUL 2>&1

for %%a in ("SleepStudy" "Kernel-Processor-Power" "UserModePowerService") do (
    wevtutil sl Microsoft-Windows-%%~a/Diagnostic /e:false
)

pause
