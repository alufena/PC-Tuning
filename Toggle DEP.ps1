$depStatusRaw = bcdedit /enum | Select-String -Pattern "nx"

if ($depStatusRaw -match "AlwaysOff") {
    $depStatus = "DISABLED"
} else {
    $depStatus = "ENABLED"
}

Write-Output "DEP (Data Execution Prevention) is currently $depStatus."

$option = Read-Host "Do you want to change the DEP state? (Y/N)"
if ($option -match "^[Yy]$") {
    if ($depStatus -eq "ENABLED") {
        Write-Output "Disabling DEP..."
        bcdedit /set nx AlwaysOff | Out-Null
        Set-ProcessMitigation -System -Disable DEP
        Set-ProcessMitigation -System -Disable EmulateAtlThunks
        Write-Output "DEP has been DISABLED. Please reboot your system for the changes to take effect."
    } else {
        Write-Output "Enabling DEP..."
        bcdedit /set nx AlwaysOn | Out-Null
        Set-ProcessMitigation -System -Enable DEP
        Set-ProcessMitigation -System -Enable EmulateAtlThunks
        Write-Output "DEP has been ENABLED. Please reboot your system for the changes to take effect."
    }
} else {
    Write-Output "No changes were made."
}

pause
