# Get current PageCombining state
$currentState = (Get-MMAgent).PageCombining
Write-Output "Current PageCombining state: $($currentState.ToString().ToUpper())"

# Describe what toggling does
Write-Output ""
Write-Output "Toggling will switch between:"
Write-Output " - ENABLED  : Windows deduplicates identical RAM pages (higher CPU use)"
Write-Output " - DISABLED : Prevents RAM scanning for duplication (lower latency)"
Write-Output ""

# Prompt for toggle
$choice = Read-Host "Do you want to toggle PageCombining? (Y/N)"

if ($choice -match "^Y|y$") {
    if ($currentState) {
        Write-Output "Disabling PageCombining..."
        Disable-MMAgent -PageCombining
    } else {
        Write-Output "Enabling PageCombining..."
        Enable-MMAgent -PageCombining
    }

    Start-Sleep -Seconds 1

    # Show new state
    $newState = (Get-MMAgent).PageCombining
    Write-Output "New PageCombining state: $($newState.ToString().ToUpper())"
} else {
    Write-Output "No changes were made."
}
