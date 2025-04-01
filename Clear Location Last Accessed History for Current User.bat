@echo off

:: Clear Microsoft Store apps last accessed history
Powershell -Command "Get-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\* | Remove-ItemProperty -Name LastUsedTimeStart -ErrorAction SilentlyContinue"

Powershell -Command "Get-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\* | Remove-ItemProperty -Name LastUsedTimeStop -ErrorAction SilentlyContinue"


:: Clear desktop apps last accessed history
Powershell -Command "Get-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\NonPackaged\* | Remove-Item -Recurse -Force"