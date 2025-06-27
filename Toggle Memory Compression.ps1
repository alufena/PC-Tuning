# Check current MemoryCompression state
$mcStatus = (Get-MMAgent).MemoryCompression
Write-Output "Memory Compression is currently: $($mcStatus.ToString().ToUpper())"

# Check current ApplicationPreLaunch state
$aplStatus = (Get-MMAgent).ApplicationPreLaunch
Write-Output "Application PreLaunch is currently: $($aplStatus.ToString().ToUpper())"

# Prompt for action
$option = Read-Host "Do you want to toggle both Memory Compression and Application PreLaunch? (Y/N)"

if ($option -match "^Y|y$") {
    if ($mcStatus) {
        Write-Output "Disabling Memory Compression..."
        Disable-MMAgent -mc
    } else {
        Write-Output "Enabling Memory Compression..."
        Enable-MMAgent -mc
    }

    if ($aplStatus) {
        Write-Output "Disabling Application PreLaunch..."
        Disable-MMAgent -apl
    } else {
        Write-Output "Enabling Application PreLaunch..."
        Enable-MMAgent -apl
    }

    Start-Sleep -Seconds 2

    # Show updated status
    $newMcStatus = (Get-MMAgent).MemoryCompression
    $newAplStatus = (Get-MMAgent).ApplicationPreLaunch

    Write-Output ""
    Write-Output "Updated states:"
    Write-Output "Memory Compression: $($newMcStatus.ToString().ToUpper())"
    Write-Output "Application PreLaunch: $($newAplStatus.ToString().ToUpper())"
} else {
    Write-Output "No changes were made."
}
