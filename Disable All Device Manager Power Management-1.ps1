Get-CimInstance -ClassName MSPower_DeviceEnable -Namespace root/WMI |
Set-CimInstance -Property @{Enable = $false}
Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | ForEach-Object { $_.enable = $false; $_.psbase.put(); }