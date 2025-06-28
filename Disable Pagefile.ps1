# Disables the Pagefile on ALL drives (No Paging File) and deletes any remaining files
Write-Output "Disabling Pagefile on all drives..."

# Disable automatic pagefile management
wmic computersystem where "name='$env:COMPUTERNAME'" set AutomaticManagedPagefile=False

# Get all physical hard drives (DriveType 3)
$drives = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

foreach ($drive in $drives) {
    $driveLetter = $drive.DeviceID
    Write-Output "Removing Pagefile from: $driveLetter"
    wmic pagefileset where "name='$driveLetter\\pagefile.sys'" set InitialSize=0,MaximumSize=0
    wmic pagefileset where "name='$driveLetter\\pagefile.sys'" delete
}

# Force remove pagefile.sys if still present
$pagefile = "$env:SystemDrive\pagefile.sys"
if (Test-Path $pagefile) {
    Write-Output "Forcing removal of the pagefile.sys file on $env:SystemDrive..."
    Remove-Item -Path $pagefile -Force -ErrorAction SilentlyContinue
}

# Disable PageCombining
Write-Output "Disabling PageCombining..."
Disable-MMAgent -PageCombining

Write-Output "Pagefile and PageCombining have been DISABLED."
Write-Output "A system restart is strongly recommended."
