@echo off

:: Created by: Shawn Brink
:: Created on: October 17, 2021
:: Tutorial: https://www.elevenforum.com/t/clear-and-reset-thumbnail-cache-in-windows-11.2051/


echo.
taskkill /f /im explorer.exe
timeout 2 /nobreak>nul
echo.

DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db

timeout 2 /nobreak>nul
start explorer.exe
