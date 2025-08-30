# Get current MaxOperationAPIFiles value
$currentValue = (Get-MMAgent).MaxOperationAPIFiles
Write-Output "Current MaxOperationAPIFiles value: $currentValue"

# Determine current state
if ($currentValue -eq 2048) {
    Write-Output "Current setting is CUSTOM (2048)."
} elseif ($currentValue -eq 256) {
    Write-Output "Current setting is DEFAULT (256)."
} else {
    Write-Output "Current setting is UNKNOWN or NON-STANDARD ($currentValue)."
}

# Ask user if they want to toggle the value
Write-Output ""
Write-Output "Toggling will switch between:"
Write-Output " - DEFAULT (256)"
Write-Output " - CUSTOM (2048) — optimized for higher operation capacity"
Write-Output ""
$choice = Read-Host "Do you want to toggle the value to 2048 or back to 256? (Y/N)"

if ($choice -match "^Y|y$") {
    if ($currentValue -eq 2048) {
        Write-Output "Reverting to DEFAULT (256)..."
        Set-MMAgent -MaxOperationAPIFiles 256
    } else {
        Write-Output "Setting MaxOperationAPIFiles to CUSTOM value (2048)..."
        Set-MMAgent -MaxOperationAPIFiles 2048
    }

    Start-Sleep -Seconds 1

    # Show new value
    $newValue = (Get-MMAgent).MaxOperationAPIFiles
    Write-Output "New MaxOperationAPIFiles value: $newValue"
} else {
    Write-Output "No changes were made."
}
