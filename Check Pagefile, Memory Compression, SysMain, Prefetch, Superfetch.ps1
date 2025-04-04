function Write-Section {
    param ($title)
    Write-Host "`n==== $title ===="
}

# === PAGEFILE ===
Write-Section "PAGEFILE"

# Verifica se o gerenciamento automático do Pagefile está ativado
$autoPagefile = (Get-WmiObject -Class Win32_ComputerSystem).AutomaticManagedPagefile
$pagefiles = Get-WmiObject Win32_PageFileUsage

# Determina se pelo menos um Pagefile está em "System Managed Size"
$hasSystemManaged = $false
foreach ($pagefile in $pagefiles) {
    if ($pagefile.AllocatedBaseSize -eq 0) { 
        $hasSystemManaged = $true
        break
    }
}

# Define o texto correto para exibir
if ($autoPagefile) {
    Write-Host "Gerenciamento do Pagefile: Automático (todos os discos)"
} elseif ($hasSystemManaged) {
    Write-Host "Gerenciamento do Pagefile: Tamanho gerenciado pelo sistema"
} else {
    Write-Host "Gerenciamento do Pagefile: Tamanho personalizado"
}

# Exibe o estado do Pagefile
if ($pagefiles) {
    Write-Host "`nEstado atual do Pagefile:"
    $pagefiles | ForEach-Object {
        Write-Host ("{0,-15} | Usado: {1,7} MB | Padrão Máximo: {2,7} MB" -f $_.Name, $_.CurrentUsage, $_.AllocatedBaseSize)
    }
} else {
    Write-Host "Nenhum Pagefile detectado no sistema."
}

# === MEMORY COMPRESSION ===
Write-Section "MEMORY COMPRESSION"
$mc = (Get-MMAgent).MemoryCompression
Write-Host "Estado: $($mc -replace 'True','Ativado' -replace 'False','Desativado')"

# === SYSMAIN (Superfetch) ===
Write-Section "SUPERFETCH (SysMain)"
$sysMain = Get-Service -Name "SysMain" -ErrorAction SilentlyContinue
if ($sysMain) {
    Write-Host "Status do serviço: $($sysMain.Status)"
} else {
    Write-Host "Serviço SysMain não encontrado."
}

# === PREFETCH & SUPERFETCH (REGISTRO) ===
Write-Section "PREFETCH & SUPERFETCH (Registro)"
try {
    $regPath = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management\\PrefetchParameters"
    if (Test-Path $regPath) {
        $params = Get-ItemProperty -Path $regPath

        # Prefetch
        $prefetchStatus = switch ($params.EnablePrefetcher) {
            0 { "Desativado" }
            1 { "Somente aplicativos" }
            2 { "Somente boot" }
            3 { "Aplicativos e boot (padrão)" }
            Default { "Desconhecido ($($params.EnablePrefetcher))" }
        }
        Write-Host "Prefetch:  $prefetchStatus"

        # Superfetch (se existir)
        if ($params.PSObject.Properties.Name -contains "EnableSuperfetch") {
            $superfetchStatus = switch ($params.EnableSuperfetch) {
                0 { "Desativado" }
                1 { "Somente aplicativos" }
                2 { "Somente boot" }
                3 { "Aplicativos e boot (padrão)" }
                Default { "Desconhecido ($($params.EnableSuperfetch))" }
            }
            Write-Host "Superfetch: $superfetchStatus"
        } else {
            Write-Host "Superfetch: Não configurado no registro."
        }
    } else {
        Write-Host "Chave de registro de Prefetch/Superfetch não encontrada."
    }
} catch {
    Write-Host "Erro ao acessar o registro de Prefetch/Superfetch."
}
