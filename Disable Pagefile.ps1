# Desativa o Pagefile em TODOS os discos (No Paging File) e deleta os arquivos remanescentes

Write-Output "Desativando Pagefile em todos os discos..."

# Desativa gerenciamento automático global
wmic computersystem where "name='$env:COMPUTERNAME'" set AutomaticManagedPagefile=False

# Obtém todos os discos rígidos
$drives = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

foreach ($drive in $drives) {
    $driveLetter = $drive.DeviceID
    Write-Output "Removendo Pagefile de: $driveLetter"
    wmic pagefileset where "name='$driveLetter\\pagefile.sys'" set InitialSize=0,MaximumSize=0
    wmic pagefileset where "name='$driveLetter\\pagefile.sys'" delete
}

# Verifica se o Pagefile ainda existe no disco principal e força a remoção
$pagefile = "$env:SystemDrive\pagefile.sys"
if (Test-Path $pagefile) {
    Write-Output "Forçando remoção do arquivo pagefile.sys em $env:SystemDrive..."
    Remove-Item -Path $pagefile -Force -ErrorAction SilentlyContinue
}

Write-Output "Pagefile foi DESATIVADO e removido. Pode ser necessário reiniciar o sistema."
