# disable_services.ps1

$partialNames = @(
    "Battle.net Update Helper",
    "BattlEye Service",
    "DiskDrill",
    "EABackgroundService",
    "Easy Anti-Cheat",
    "Epic Games Updater",
    "Epic Online Services",
    "Google Chrome Elevation Service",
    "Google Updater Internal Service",
    "Google Updater Service",
    "MBVpnTunnelService",
    "Mozilla Maintenance Service",
    "Net.Tcp Port Sharing Service",
    "NVIDIA Display Container",
    "Razer Central Service",
    "Razer Synapse",
    "Rockstar Game Library Service",
    "Steam Client Service"
)

foreach ($partial in $partialNames) {
    $services = Get-Service | Where-Object { $_.DisplayName -like "*$partial*" }
    if ($services.Count -eq 0) {
        Write-Host "Service not found: $partial" -ForegroundColor DarkGray
        continue
    }

    foreach ($s in $services) {
        Write-Host "Disabling $($s.DisplayName) ($($s.Name))..." -ForegroundColor Yellow
        try {
            Stop-Service -Name $s.Name -Force -ErrorAction Stop
            Set-Service -Name $s.Name -StartupType Disabled
            Write-Host " -> Success" -ForegroundColor Green
        } catch {
            Write-Host " -> Failed: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

Write-Host "`nDone. All matched services have been disabled." -ForegroundColor Cyan
Exit
