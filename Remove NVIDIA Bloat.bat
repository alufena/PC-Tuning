@ECHO OFF

echo Stopping NVIDIA processes...
taskkill /f /im nvcontainer.exe 2>nul
taskkill /f /im NVDisplay.Container.exe 2>nul
taskkill /f /im nvidia*.exe 2>nul

echo Stopping NVIDIA services...
net stop NVDisplay.ContainerLocalSystem 2>nul
net stop NvContainerLocalSystem 2>nul
net stop NVDisplay.Container 2>nul
net stop NvContainerNetworkService 2>nul
net stop NvTelemetryContainer 2>nul

echo Waiting for services to stop...
timeout /t 3 /nobreak >nul

echo Searching and removing telemetry files...

FOR /F "delims=" %%i IN ('DIR /B /S "%WINDIR%\System32\DriverStore\FileRepository\*NvGSTPlugin*" 2^>nul') DO (
    echo Processing: %%i
    takeown /F "%%i" /A >nul 2>&1
    icacls "%%i" /grant administrators:F >nul 2>&1
    attrib -s -h -r "%%i" >nul 2>&1
    del /F /Q "%%i" >nul 2>&1
    if exist "%%i" (
        echo File locked, renaming: %%i
        ren "%%i" "%%i.disabled" >nul 2>&1
    ) else (
        echo Deleted: %%i
    )
)

FOR /F "delims=" %%i IN ('DIR /B /S "%WINDIR%\System32\DriverStore\FileRepository\*DisplayDriverRA*" 2^>nul') DO (
    echo Processing: %%i
    takeown /F "%%i" /A >nul 2>&1
    icacls "%%i" /grant administrators:F >nul 2>&1
    attrib -s -h -r "%%i" >nul 2>&1
    del /F /Q "%%i" >nul 2>&1
    if exist "%%i" (
        echo File locked, renaming: %%i
        ren "%%i" "%%i.disabled" >nul 2>&1
    ) else (
        echo Deleted: %%i
    )
)

FOR /F "delims=" %%i IN ('DIR /B /S "%WINDIR%\System32\DriverStore\FileRepository\*NvMsgBusBroadcast*" 2^>nul') DO (
    echo Processing: %%i
    takeown /F "%%i" /A >nul 2>&1
    icacls "%%i" /grant administrators:F >nul 2>&1
    attrib -s -h -r "%%i" >nul 2>&1
    del /F /Q "%%i" >nul 2>&1
    if exist "%%i" (
        echo File locked, renaming: %%i
        ren "%%i" "%%i.disabled" >nul 2>&1
    ) else (
        echo Deleted: %%i
    )
)

FOR /F "delims=" %%i IN ('DIR /B /S "%WINDIR%\System32\DriverStore\FileRepository\nvtopps.dll" 2^>nul') DO (
    echo Processing: %%i
    takeown /F "%%i" /A >nul 2>&1
    icacls "%%i" /grant administrators:F >nul 2>&1
    attrib -s -h -r "%%i" >nul 2>&1
    del /F /Q "%%i" >nul 2>&1
    if exist "%%i" (
        echo File locked, renaming: %%i
        ren "%%i" "%%i.disabled" >nul 2>&1
    ) else (
        echo Deleted: %%i
    )
)

FOR /F "delims=" %%i IN ('DIR /B /S "%WINDIR%\System32\DriverStore\FileRepository\*nvprofileupdaterplugin*" 2^>nul') DO (
    echo Processing: %%i
    takeown /F "%%i" /A >nul 2>&1
    icacls "%%i" /grant administrators:F >nul 2>&1
    attrib -s -h -r "%%i" >nul 2>&1
    del /F /Q "%%i" >nul 2>&1
    if exist "%%i" (
        echo File locked, renaming: %%i
        ren "%%i" "%%i.disabled" >nul 2>&1
    ) else (
        echo Deleted: %%i
    )
)

echo Removing telemetry directories...

RMDIR /S /Q "C:\ProgramData\NVIDIA Corporation\DisplayDriverRAS" 2>nul
RMDIR /S /Q "C:\ProgramData\NVIDIA Corporation\GameSessionTelemetry" 2>nul
RMDIR /S /Q "C:\ProgramData\NVIDIA Corporation\NvProfileUpdaterPlugin" 2>nul
RMDIR /S /Q "C:\ProgramData\NVIDIA Corporation\nvtopps" 2>nul

echo Checking and starting services...
sc query NVDisplay.ContainerLocalSystem | find "STOPPED" >nul
if %errorlevel% equ 0 (
    echo Starting NVDisplay.ContainerLocalSystem...
    net start NVDisplay.ContainerLocalSystem >nul 2>&1
)

sc query NvContainerLocalSystem | find "STOPPED" >nul
if %errorlevel% equ 0 (
    echo Starting NvContainerLocalSystem...
    net start NvContainerLocalSystem >nul 2>&1
)

echo.
echo Process completed.
echo.
timeout /t 5
exit
