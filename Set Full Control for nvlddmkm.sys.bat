@echo off
set "BaseDir=%SystemRoot%\System32\DriverStore\FileRepository"

for /d %%D in ("%BaseDir%\nv_dispi.inf_amd64_*") do (
    if exist "%%D\nvlddmkm.sys" (
        set "Target=%%D\nvlddmkm.sys"
        goto :Apply
    )
)

exit /b 1

:Apply
takeown /F "%Target%" /A
icacls   "%Target%" /grant *S-1-5-32-544:F
timeout 3
exit
