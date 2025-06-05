# Enables the Pagefile as "System Managed Size" on ALL drives

Write-Output "Enabling Pagefile as 'System Managed Size' for all drives..."

# Disables the global option "Automatically manage paging file size for all drives"
wmic computersystem where "name='$env:COMPUTERNAME'" set AutomaticManagedPagefile=False

# Gets the list of hard drives
$drives = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

foreach ($drive in $drives) {
    $driveLetter = $drive.DeviceID
    Write-Output "Enabling Pagefile on: $driveLetter"

    # Checks if the pagefile already exists to avoid errors
    $exists = Get-WmiObject Win32_PageFileSetting | Where-Object { $_.Name -eq "$driveLetter\pagefile.sys" }

    if (-not $exists) {
        wmic pagefileset create name="$driveLetter\pagefile.sys"
    }
    
    wmic pagefileset where "name='$driveLetter\\pagefile.sys'" set InitialSize=0,MaximumSize=0
}

Write-Output "Pagefile has been enabled as 'System Managed Size' for all drives."
