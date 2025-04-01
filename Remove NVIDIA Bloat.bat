@ECHO OFF
SET Dir0=C:\Windows\System32\DriverStore\FileRepository
SET Dir1=\Display.NvContainer\plugins\LocalSystem
SET Dir2=\Display.NvContainer\plugins\Session

net stop NVDisplay.ContainerLocalSystem

FOR /F "tokens=*" %%G in ('DIR /B "%Dir0%\nv_dispig.inf_amd64_*"') DO (
takeown /F "%Dir0%\%%G%Dir1%\_DisplayDriverRAS.dll" /A
takeown /F "%Dir0%\%%G%Dir1%\_NvMsgBusBroadcast.dll" /A
takeown /F "%Dir0%\%%G%Dir1%\_nvtopps.dll" /A
takeown /F "%Dir0%\%%G%Dir2%\_NvGSTPlugin.dll" /A
takeown /F "%Dir0%\%%G%Dir2%\nvprofileupdaterplugin.dll" /A
del /F /Q "%Dir0%\%%G%Dir1%\_DisplayDriverRAS.dll"
del /F /Q "%Dir0%\%%G%Dir1%\_NvMsgBusBroadcast.dll"
del /F /Q "%Dir0%\%%G%Dir1%\_nvtopps.dll"
del /F /Q "%Dir0%\%%G%Dir2%\_NvGSTPlugin.dll"
del /F /Q "%Dir0%\%%G%Dir2%\nvprofileupdaterplugin.dll"
)

RMDIR /S /Q "C:\ProgramData\NVIDIA Corporation\DisplayDriverRAS"
RMDIR /S /Q "C:\ProgramData\NVIDIA Corporation\GameSessionTelemetry"
RMDIR /S /Q "C:\ProgramData\NVIDIA Corporation\NvProfileUpdaterPlugin"
RMDIR /S /Q "C:\ProgramData\NVIDIA Corporation\nvtopps"

net start NVDisplay.ContainerLocalSystem
timeout 8
exit