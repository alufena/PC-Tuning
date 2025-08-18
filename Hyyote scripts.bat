@echo off
setlocal EnableDelayedExpansion

POWERSHELL "ForEach($v in (Get-Command -Name \"Set-ProcessMitigation\").Parameters[\"Disable\"].Attributes.ValidValues){Set-ProcessMitigation -System -Disable $v.ToString() -ErrorAction SilentlyContinue}" >NUL 2>&1

ECHO Disabling IoLatencyCap...
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services" /S /F "IoLatencyCap"^| FINDSTR /V "IoLatencyCap"') DO (
    REG ADD "%%a" /v "IoLatencyCap" /t REG_DWORD /d "0" /f >NUL 2>&1
    REM The following SET commands are for debugging/logging within the script, not strictly necessary for functionality.
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
    REM The following SET commands are for debugging/logging within the script, not strictly necessary for functionality.
    FOR /F "tokens=*" %%z IN ("%%a") DO (
        SET STR=%%z
        SET STR=!STR:HKLM\System\CurrentControlSet\Services\=!
    )
)

ECHO Removing adapters off QoS Service...
FOR /F %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services\Psched\Parameters\Adapters"') DO (
    REG DELETE %%a /F >NUL 2>&1
    REM The following SET commands are for debugging/logging within the script, not strictly necessary for functionality.
    FOR /F "tokens=*" %%z IN ("%%a") DO (
        SET STR=%%z
        SET STR=!STR:HKLM\System\CurrentControlSet\Services\Psched\Parameters\Adapters\=!
    )
)

ECHO Disabling QoS and NdisCap...
FOR /F "tokens=3*" %%I IN ('REG QUERY "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkCards" /F "ServiceName" /S^| FINDSTR /I /L "ServiceName"') DO (
    FOR /F %%a IN ('REG QUERY "HKLM\System\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}" /F "%%I" /D /E /S^| FINDSTR /I /L "\\Class\\"') DO SET "REGPATH=%%a"
    FOR /F "tokens=3*" %%n in ('REG QUERY "!REGPATH!" /V "FilterList"') DO SET "newFilterList=%%n"
    SET newFilterList=!newFilterList:-{B5F4D659-7DAA-4565-8E41-BE220ED60542}=!
    SET newFilterList=!newFilterList:-{430BDADD-BAB0-41AB-A369-94B67FA5BE0A}=!
    REG QUERY "!REGPATH!" /V "FilterList" | FINDSTR /I "{B5F4D659-7DAA-4565-8E41-BE220ED60542} {430BDADD-BAB0-41AB-A369-94B67FA5BE0A}" >NUL 2>&1
    IF NOT ERRORLEVEL 1 (
        REG ADD "!REGPATH!" /F /V "FilterList" /T REG_MULTI_SZ /d "!newFilterList!" >NUL 2>&1
    )
)

ECHO Disabling StorPort idle...
FOR /F "tokens=*" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Enum" /S /F "StorPort"^| FINDSTR /E "StorPort"') DO (
    REG ADD "%%a" /v "EnableIdlePowerManagement" /t REG_DWORD /d "0" /f >NUL 2>&1
    REM The following SET commands are for debugging/logging within the script, not strictly necessary for functionality.
    FOR /F "tokens=*" %%z IN ("%%a") DO (
        SET STR=%%z
        SET STR=!STR:HKLM\System\CurrentControlSet\Enum\=!
        SET STR=!STR:\Device Parameters\StorPort=!
    )
)

for %%a in ("SleepStudy" "Kernel-Processor-Power" "UserModePowerService") do (
    wevtutil sl Microsoft-Windows-%%~a/Diagnostic /e:false
)

ECHO Disabling background access of default apps...
POWERSHELL "ForEach($key in (Get-ChildItem 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications')) { Set-ItemProperty -Path ('HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\' + $key.PSChildName) -Name 'Disabled' -Value 1 -ErrorAction SilentlyContinue }" >NUL 2>&1

ECHO Disabling synchronisation of settings...
POWERSHELL -Command "Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync' -Name 'BackupPolicy' -Value 0x3c -ErrorAction SilentlyContinue; Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync' -Name 'DeviceMetadataUploaded' -Value 0 -ErrorAction SilentlyContinue; Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync' -Name 'PriorLogons' -Value 1 -ErrorAction SilentlyContinue" >NUL 2>&1
POWERSHELL -Command "$groups = @('Accessibility','AppSync','BrowserSettings','Credentials','DesktopTheme','Language','PackageState','Personalization','StartLayout','Windows'); foreach ($group in $groups) { $path = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\' + $group; New-Item -Path $path -Force -ErrorAction SilentlyContinue | Out-Null; Set-ItemProperty -Path $path -Name 'Enabled' -Value 0 -ErrorAction SilentlyContinue }" >NUL 2>&1

ECHO Removing SystemApps telemetry...
set key=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\InboxApplications
for %%i in (
AppRep.ChxApp
CloudExperienceHost
SecHealthUI
) do (
    for /f %%a in ('reg query "%key%" /f %%i /k ^| find /i "InboxApplications"') do if not errorlevel 1 (reg delete "%%a" /f)
)

ECHO Display tweaks (Questionable)
FOR /F "DELIMS=DesktopMonitor, " %%i in ('WMIC PATH Win32_DesktopMonitor GET DeviceID^| FINDSTR /L "DesktopMonitor"') DO (
    SET MonitorAmount=%%i
)
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v Display%MonitorAmount%_PipeOptimizationEnable /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO Disabling disk power savings...
for %%i in (EnableHIPM EnableDIPM EnableHDDParking) do (
    for /f %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" /s /f "%%i" ^| findstr "HKEY"') do (
        REG ADD "%%a" /v "%%i" /t REG_DWORD /d 0 /f >NUL 2>&1
    )
)

for /f %%i in ('call "resources\smartctl.exe" --scan') do (
    call "resources\smartctl.exe" -s apm,off %%i
    call "resources\smartctl.exe" -s aam,off %%i
)

ECHO Enabling MSI mode support for IDE controller...
for /f %%i in ('wmic path Win32_IDEController get PNPDeviceID ^| findstr /l "PCI\VEN_"') do (
    reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f
)

DISM > nul 2>&1 || echo error: administrator privileges required && pause && exit /b 1

for %%a in (
    "EnhancedPowerManagementEnabled"
    "AllowIdleIrpInD3"
    "EnableSelectiveSuspend"
    "DeviceSelectiveSuspended"
    "SelectiveSuspendEnabled"
    "SelectiveSuspendOn"
    "WaitWakeEnabled"
    "D3ColdSupported"
    "WdfDirectedPowerTransitionEnable"
    "EnableIdlePowerManagement"
    "IdleInWorkingState"
) do (
    echo info: configuring %%~a
    for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "%%~a" ^| findstr "HKEY"') do (
        reg.exe add "%%b" /v "%%~a" /t REG_DWORD /d "0" /f > nul 2>&1
    )
)

for %%a in (
    "WakeEnabled" 
    "WdkSelectiveSuspendEnable"
) do (
    echo info: configuring %%~a
    for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class" /s /f "%%~a" ^| findstr "HKEY"') do (
        reg.exe add "%%b" /v "%%~a" /t REG_DWORD /d "0" /f > nul 2>&1
    )
)
echo info: done

ECHO USB tweaks...
for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\USB" /s /f "Device Parameters" ^| findstr "Device Parameters"') do (
    reg add "%%i" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f >nul
    reg add "%%i" /v "D3ColdSupported" /t REG_DWORD /d "0" /f >nul
    reg add "%%i" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f >nul
    reg add "%%i" /v "EnableSelectiveSuspend" /t REG_DWORD /d "0" /f >nul
    reg add "%%i" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f >nul
    reg add "%%i" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f >nul
    reg add "%%i" /v "SelectiveSuspendOn" /t REG_DWORD /d "0" /f >nul
    reg add "%%i" /v "fid_D1Latency" /t REG_DWORD /d "0" /f >nul
    reg add "%%i" /v "fid_D2Latency" /t REG_DWORD /d "0" /f >nul
    reg add "%%i" /v "fid_D3Latency" /t REG_DWORD /d "0" /f >nul
	reg add "%%i" /v "PowerManaged" /t REG_DWORD /d "0" /f >nul
	reg add "%%i" /v "UserSetDeviceIdleEnabled" /t REG_DWORD /d "0" /f >nul
	reg add "%%i" /v "IdleEnabled" /t REG_DWORD /d "0" /f >nul
	reg add "%%i" /v "SystemManagedIdleTimeout" /t REG_DWORD /d "0" /f >nul
	reg add "%%i" /v "UserWriteCacheSetting" /t REG_DWORD /d "0" /f >nul
	reg add "%%i" /v "WriteCacheEnableOverride" /t REG_DWORD /d "0" /f >nul
	reg add "%%i" /v "DefaultPowerState" /t REG_DWORD /d "0" /f >nul
    reg add "%%i\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul
)

ECHO WppRecorder_UseTimeStamp to 0 wherever it is found
REM List of root hives to search. You can add or remove hives as needed.
for %%H in (HKLM HKCU HKCR HKU) do (
    echo Searching %%H ...
    REM Query for keys containing the value name and parse only lines starting with "HKEY"
    for /f "delims=" %%K in ('reg query "%%H" /f WppRecorder_UseTimeStamp /s /t REG_DWORD 2^>nul ^| findstr /r /i "^HKEY"') do (
        echo    Updating %%K
        reg add "%%K" /v WppRecorder_UseTimeStamp /t REG_DWORD /d 0 /f >nul
    )
)

echo.
echo All occurrences of WppRecorder_UseTimeStamp have been set to 0.

endlocal
timeout 8
exit
