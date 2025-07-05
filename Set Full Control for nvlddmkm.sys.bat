@echo off
setlocal EnableDelayedExpansion
set "BaseDir=%SystemRoot%\System32\DriverStore\FileRepository"
set "Target="

for /d %%D in ("%BaseDir%\nv_disp*.inf_amd64_*") do (
    if exist "%%D\nvlddmkm.sys" (
        set "Target=%%D\nvlddmkm.sys"
    )
)

if not defined Target (
    echo nvlddmkm.sys not found.
    timeout /t 3 >nul
    exit /b 1
)

echo File found: %Target%

takeown /F "%Target%" /A
icacls "%Target%" /grant *S-1-5-32-544:F >nul
icacls "%Target%" /grant *S-1-5-32-545:F >nul

echo Permissions successfully applied.
timeout /t 3 >nul
exit
