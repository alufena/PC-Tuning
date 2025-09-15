<#
.SYNOPSIS
    Toggles the MaxOperationAPIFiles value between the system default (256 for Win10, 512 for Win11)
    and an optimized value (2048) for the memory compression feature.

.DESCRIPTION
    This script checks the Windows version to determine the correct default value for MaxOperationAPIFiles.
    It reports the current status and allows the user to toggle to a custom value (2048) to
    potentially improve performance in high-load scenarios, or revert to the default.
    It should be run with Administrator privileges.

.AUTHOR
    Gemini
#>

# Force execution as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "This script needs to be run as Administrator. Restarting..."
    Start-Process powershell -Verb RunAs -ArgumentList "-File `"$PSCommandPath`""
    exit
}

# --- Logic Start ---

# Optimized/custom value (tweak)
$customValue = 2048
$defaultValue = $null
$osVersionString = ""

# 1. Detect Windows version to set the correct default value
$osInfo = (Get-ComputerInfo).OsName
if ($osInfo -match "Windows 11") {
    $defaultValue = 512
    $osVersionString = "Windows 11"
} elseif ($osInfo -match "Windows 10") {
    $defaultValue = 256
    $osVersionString = "Windows 10"
} else {
    Write-Warning "Operating system not identified as Windows 10 or 11. Assuming a default of 256."
    $defaultValue = 256 # Fallback for other systems
    $osVersionString = "Unknown"
}

# 2. Get the current value
$currentValue = (Get-MMAgent).MaxOperationAPIFiles

# 3. Intelligently report the current state
Write-Host "Detected Operating System: $osVersionString" -ForegroundColor Cyan
Write-Output "Current MaxOperationAPIFiles value: $currentValue"

if ($currentValue -eq $defaultValue) {
    Write-Host "Current setting is the DEFAULT for your system ($defaultValue)." -ForegroundColor Green
} elseif ($currentValue -eq $customValue) {
    Write-Host "Current setting is CUSTOM ($customValue)." -ForegroundColor Yellow
} else {
    Write-Host "Current setting is NON-STANDARD ($currentValue)." -ForegroundColor Red
}

# 4. Ask the user if they want to toggle
Write-Output ""
Write-Output "Toggling will switch between:"
Write-Output " - DEFAULT ($defaultValue)"
Write-Output " - CUSTOM ($customValue) — optimized for higher operation capacity"
Write-Output ""
$choice = Read-Host "Do you want to toggle the value? (Y/N)"

if ($choice -match "^Y|y$") {
    # If the current value is the custom one, revert to default.
    # In any other case (be it default or an unknown value), apply the custom value.
    if ($currentValue -eq $customValue) {
        Write-Output "Reverting to the DEFAULT value ($defaultValue)..."
        Set-MMAgent -MaxOperationAPIFiles $defaultValue
    } else {
        Write-Output "Applying the CUSTOM value ($customValue)..."
        Set-MMAgent -MaxOperationAPIFiles $customValue
    }

    Start-Sleep -Seconds 1

    # Show the new value for confirmation
    $newValue = (Get-MMAgent).MaxOperationAPIFiles
    Write-Host "New MaxOperationAPIFiles value: $newValue" -ForegroundColor Magenta
} else {
    Write-Output "No changes were made."
}

Write-Output ""
Read-Host "Press Enter to exit."
