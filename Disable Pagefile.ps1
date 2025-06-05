# Disables the Pagefile on ALL drives (No Paging File) and deletes any remaining files

Write-Output "Disabling Pagefile on all drives..."

# Disables global automatic management
wmic computersystem where "name='$env:COMPUTERNAME'" set AutomaticManagedPagefile=False

# Gets all hard drives
$drives = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

foreach ($drive in $drives) {
    $driveLetter = $drive.DeviceID
    Write-Output "Removing Pagefile from: $driveLetter"
    wmic pagefileset where "name='$driveLetter\\pagefile.sys'" set InitialSize=0,MaximumSize=0
    wmic pagefileset where "name='$driveLetter\\pagefile.sys'" delete
}

# Checks if the Pagefile still exists on the main drive and forces removal
$pagefile = "$env:SystemDrive\pagefile.sys"
if (Test-Path $pagefile) {
    Write-Output "Forcing removal of the pagefile.sys file on $env:SystemDrive..."
    Remove-Item -Path $pagefile -Force -ErrorAction SilentlyContinue
}

Write-Output "Pagefile has been DISABLED and removed. A system restart may be required."
