::ECHO Open folder
::add my nvidia-smi folder to PATH variable
::cd /d c:\Program Files\NVIDIA Corporation\NVSMI

ECHO NVIDIA-SMI
::use `-l < time you want it to refresh >` to keep window
call nvidia-smi.exe -l 5