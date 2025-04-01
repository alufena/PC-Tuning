:: Created by: Shawn Brink
:: Created on: November 4, 2021
:: Tutorial: https://www.elevenforum.com/t/clear-windows-update-history-in-windows-11.2509/


@echo off
powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,net stop usosvc & net stop wuauserv & del %systemroot%\SoftwareDistribution\DataStore\Logs\edb.log & del /f /q C:\ProgramData\USOPrivate\UpdateStore\* & net start usosvc & net start wuauserv & UsoClient.exe RefreshSettings' -Verb runAs"


