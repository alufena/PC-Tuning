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

foreach ($folder in $folders) {
    if (Test-Path $folder) {
        Get-ChildItem $folder -Recurse -File | Remove-Item -Force
        Write-Host "$folder - Arquivos deletados"
    } else {
        Write-Host "$folder - Pasta não encontrada"
    }
}