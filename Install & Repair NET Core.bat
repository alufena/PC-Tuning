@echo off
title Installing .NET Desktop Runtime - Local Files (FORCED)
color 1F
echo Installing .NET Desktop Runtime with forced repair...

:: .NET Core 3.1
echo Installing .NET 3.1...
"G:\Setups\NET Core\windowsdesktop-runtime-3.1.32-win-x86.exe" /quiet /norestart /repair
"G:\Setups\NET Core\windowsdesktop-runtime-3.1.32-win-x64.exe" /quiet /norestart /repair

:: .NET 6.0
echo Installing .NET 6.0...
"G:\Setups\NET Core\windowsdesktop-runtime-6.0.36-win-x86.exe" /quiet /norestart /repair
"G:\Setups\NET Core\windowsdesktop-runtime-6.0.36-win-x64.exe" /quiet /norestart /repair

:: .NET 7.0
echo Installing .NET 7.0...
"G:\Setups\NET Core\windowsdesktop-runtime-7.0.20-win-x86.exe" /quiet /norestart /repair
"G:\Setups\NET Core\windowsdesktop-runtime-7.0.20-win-x64.exe" /quiet /norestart /repair

:: .NET 8.0
echo Installing .NET 8.0...
"G:\Setups\NET Core\windowsdesktop-runtime-8.0.17-win-x86.exe" /quiet /norestart /repair
"G:\Setups\NET Core\windowsdesktop-runtime-8.0.17-win-x64.exe" /quiet /norestart /repair

:: .NET 9.0
echo Installing .NET 9.0...
"G:\Setups\NET Core\windowsdesktop-runtime-9.0.6-win-x86.exe" /quiet /norestart /repair
"G:\Setups\NET Core\windowsdesktop-runtime-9.0.6-win-x64.exe" /quiet /norestart /repair

exit