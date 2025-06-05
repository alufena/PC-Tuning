$folders = @(
    "C:\Program Files (x86)\Steam\steamapps\common\No Man's Sky\GAMEDATA\SHADERCACHE",
    "C:\Program Files (x86)\Steam\steamapps\shadercache",
    "C:\Users\Administrator\AppData\Local\D3DSCache",
    "C:\Users\Administrator\AppData\LocalLow\NVIDIA\PerDriverVersion\DXCache",
    "C:\Users\Administrator\AppData\LocalLow\NVIDIA\PerDriverVersion\GLCache",
    "C:\Users\Administrator\AppData\Local\NVIDIA\DXCache",
    "C:\Users\Administrator\AppData\Local\NVIDIA\GLCache",
    "D:\SteamLibrary\steamapps\shadercache",
    "E:\SteamLibrary\steamapps\shadercache",
    "F:\SteamLibrary\steamapps\shadercache",
    "G:\SteamLibrary\steamapps\shadercache",
    "C:\Windows\Prefetch",
    "C:\Users\Administrator\AppData\Local\NVIDIA\VulkanCache",
    "C:\Users\Administrator\AppData\LocalLow\NVIDIA\PerDriverVersion\VkCache",
    "C:\ProgramData\NVIDIA\NvBackend\ApplicationOntology\cache",
    "C:\ProgramData\NVIDIA Corporation\NV_Cache",
    "C:\Users\Administrator\AppData\Local\NVIDIA\NvTelemetryContainer",
    "C:\Users\Administrator\AppData\Roaming\NVIDIA\ComputeCache",
    "C:\Windows\Temp\NVIDIA Corporation",
    "C:\Users\Administrator\AppData\Local\Temp\NVIDIA Corporation",
    "C:\Users\Administrator\AppData\Roaming\NVIDIA"
)

$totalSize = 0

foreach ($folder in $folders) {
    if (Test-Path $folder) {
        $size = (Get-ChildItem $folder -Recurse -File | Measure-Object -Property Length -Sum).Sum
        $sizeMB = "{0:N2}" -f ($size / 1MB)
        Write-Host "$folder - Size: $sizeMB MB"
        $totalSize += $size
    } else {
        Write-Host "$folder - Folder not found"
    }
}

# Calculate and display total size in different units
$totalSizeMB = "{0:N2}" -f ($totalSize / 1MB)
$totalSizeGB = "{0:N2}" -f ($totalSize / 1GB)

Write-Host ""
Write-Host "============================================="
Write-Host "TOTAL SIZE OF ALL SHADER AND PREFETCH CACHES:"
Write-Host "$totalSizeMB MB ($totalSizeGB GB)"
Write-Host "============================================="
pause
