$RegExe = "$env:SystemRoot\System32\Reg.exe" 

$File = "$env:Temp\Temp.reg" 

$Key = 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes\{885a186e-a440-4ada-812b-db871b942259}' 

& $RegExe Export $Key $File /y 

$Data = Get-Content $File 

$Data = $Data -Replace 'HKEY_LOCAL_MACHINE', 'HKEY_CURRENT_USER' 

$Data = $Data -Replace '"GroupBy"="System.DateModified"', '"GroupBy"=""' 

$Data | Out-File $File 

& $RegExe Import $File 

$Key = 'HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell' 

& $RegExe Delete "$Key\BagMRU" /f 

& $RegExe Delete "$Key\Bags" /f 

Stop-Process -Force -ErrorAction SilentlyContinue -ProcessName Explorer
