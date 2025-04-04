# Ativa o Pagefile como "System Managed Size" em TODOS os discos

Write-Output "Ativando Pagefile como 'System Managed Size' para todos os discos..."

# Desativa a opção global "Automatically manage paging file size for all drives"
wmic computersystem where "name='$env:COMPUTERNAME'" set AutomaticManagedPagefile=False

# Obtém a lista de discos rígidos
$drives = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

foreach ($drive in $drives) {
    $driveLetter = $drive.DeviceID
    Write-Output "Ativando Pagefile em: $driveLetter"

    # Verifica se o pagefile já existe para evitar erro
    $exists = Get-WmiObject Win32_PageFileSetting | Where-Object { $_.Name -eq "$driveLetter\pagefile.sys" }

    if (-not $exists) {
        wmic pagefileset create name="$driveLetter\pagefile.sys"
    }
    
    wmic pagefileset where "name='$driveLetter\\pagefile.sys'" set InitialSize=0,MaximumSize=0
}

Write-Output "Pagefile foi ativado como 'System Managed Size' para todos os discos."
