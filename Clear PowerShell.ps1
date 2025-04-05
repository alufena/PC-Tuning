# Script para limpar completamente o historico do PowerShell - compativel com todas as codificacoes
# Remove sessoes antigas, historicos e arquivos temporarios sem interatividade

# Caminhos padrao de historicos
$PSReadlinePath = "$ENV:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
$ISEHistoryPath = "$ENV:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\PSReadline_history.txt"
$ISEHistoryPath2 = "$ENV:USERPROFILE\Documents\WindowsPowerShell\PSReadline_history.xml"
$PS7HistoryPath = "$ENV:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\PowerShell_history.txt"

# Locais adicionais para sessoes antigas e arquivos temporarios
$AdditionalLocations = @(
    # Sessoes do ISE e arquivos temporarios
    "$ENV:USERPROFILE\AppData\Local\Microsoft_Corporation\powershell_ise.exe*"
    "$ENV:USERPROFILE\AppData\Local\Microsoft\Windows\PowerShell\*"
    "$ENV:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\*"
    "$ENV:USERPROFILE\Documents\WindowsPowerShell\*"
    "$ENV:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\*"
    "$ENV:LOCALAPPDATA\Microsoft\Windows\PowerShell\*"
    
    # Historicos salvos em outras possiveis localizacoes
    "$ENV:USERPROFILE\AppData\Roaming\Microsoft\PowerShell\PSReadLine\*history*.txt"
    "$ENV:USERPROFILE\AppData\Local\Temp\*powershell*"
    "$ENV:USERPROFILE\AppData\Local\Microsoft\Windows\PowerShell\*"
    
    # Caminhos para arquivos .psxml (dados de sessao)
    "$ENV:TEMP\*PowerShell*.psxml"
    "$ENV:TEMP\*ISE*.psxml"
    "$ENV:USERPROFILE\Documents\WindowsPowerShell\Sessions\*"
    
    # Arquivos relacionados ao PowerShell ISE
    "$ENV:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell ISE\*"
    "$ENV:APPDATA\Microsoft\Windows\PowerShell ISE\*"
    "$ENV:LOCALAPPDATA\Microsoft\Windows\PowerShell ISE\*"
)

# Funcao para limpar arquivos com tratamento de erro
function Clear-HistoryFile {
    param($Path)
    if (Test-Path -Path $Path) {
        try {
            Write-Output "Limpando arquivo de historico: $Path"
            # Usando conjunto vazio para limpar o arquivo
            Set-Content -Path $Path -Value $null -Force -ErrorAction Stop
            Write-Output "Arquivo de historico limpo com sucesso: $Path"
        }
        catch {
            Write-Output "Erro ao limpar arquivo: $Path - $_"
            # Tenta uma abordagem alternativa se a primeira falhar
            try {
                Remove-Item -Path $Path -Force -ErrorAction Stop
                Write-Output "Arquivo removido: $Path"
            }
            catch {
                Write-Output "Falha ao remover arquivo: $Path - $_"
            }
        }
    }
}

# Funcao para limpar todos os arquivos em um padrao
function Clear-HistoryPattern {
    param($Pattern)
    try {
        $files = Get-ChildItem -Path $Pattern -File -ErrorAction SilentlyContinue
        if ($files) {
            Write-Output "Limpando $($files.Count) arquivos em: $Pattern"
            foreach ($file in $files) {
                try {
                    if ($file.Extension -eq ".xml" -or $file.Extension -eq ".psxml") {
                        # Remove arquivos XML/PSXML completamente
                        Remove-Item -Path $file.FullName -Force -ErrorAction Stop
                    }
                    else {
                        # Limpa conteudo de outros arquivos
                        Set-Content -Path $file.FullName -Value $null -Force -ErrorAction Stop
                    }
                    Write-Output "  Processado: $($file.Name)"
                }
                catch {
                    Write-Output "  Erro ao processar $($file.Name): $_"
                    # Tenta remover se nao conseguir limpar
                    Remove-Item -Path $file.FullName -Force -ErrorAction SilentlyContinue
                }
            }
        }
    }
    catch {
        Write-Output "Erro ao processar padrao: $Pattern - $_"
    }
}

# Limpa o registro do ISE
function Clear-ISERegistry {
    try {
        Write-Output "Limpando registro do PowerShell ISE..."
        
        # Caminho para as chaves de registro do ISE
        $regPaths = @(
            'HKCU:\Software\Microsoft\PowerShell\3\ISE',
            'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU'
        )
        
        foreach ($path in $regPaths) {
            if (Test-Path -Path $path) {
                # Limpa as chaves relacionadas a historico e arquivos recentes
                $keys = Get-Item -Path $path | Select-Object -ExpandProperty Property
                foreach ($key in $keys) {
                    if ($key -like "*MRU*" -or $key -like "*Recent*" -or $key -like "*History*") {
                        Remove-ItemProperty -Path $path -Name $key -Force -ErrorAction SilentlyContinue
                        Write-Output "  Removida chave de registro: $path\$key"
                    }
                }
            }
        }
    }
    catch {
        Write-Output "Erro ao limpar registro: $_"
    }
}

# Limpar arquivos de historico principais
Write-Output "=== Limpando arquivos de historico principais ==="
Clear-HistoryFile -Path $PSReadlinePath
Clear-HistoryFile -Path $ISEHistoryPath
Clear-HistoryFile -Path $ISEHistoryPath2
Clear-HistoryFile -Path $PS7HistoryPath

# Limpar historico da sessao atual
if (Get-Command "Clear-History" -ErrorAction SilentlyContinue) {
    Write-Output "=== Limpando historico da sessao atual ==="
    Clear-History -ErrorAction SilentlyContinue
}

# Limpar arquivos em localizacoes adicionais
Write-Output "=== Limpando sessoes antigas e arquivos temporarios ==="
foreach ($location in $AdditionalLocations) {
    Clear-HistoryPattern -Pattern $location
}

# Limpar cache de modulos
Write-Output "=== Limpando cache de modulos ==="
$ModuleCache = "$ENV:USERPROFILE\Documents\WindowsPowerShell\Modules"
if (Test-Path -Path $ModuleCache) {
    Get-ChildItem -Path $ModuleCache -Recurse -Filter "*.cache" | 
    ForEach-Object {
        Remove-Item -Path $_.FullName -Force -ErrorAction SilentlyContinue
        Write-Output "Removido cache: $($_.FullName)"
    }
}

# Limpar o registro do ISE
Clear-ISERegistry

# Limpar pastas de sessoes temporarias do ISE
$TempISEFolders = Get-ChildItem -Path $ENV:TEMP -Directory -Filter "*ISE*" -ErrorAction SilentlyContinue
foreach ($folder in $TempISEFolders) {
    Write-Output "Removendo pasta temporaria do ISE: $($folder.FullName)"
    Remove-Item -Path $folder.FullName -Recurse -Force -ErrorAction SilentlyContinue
}

# Limpar arquivos temporarios relacionados ao PowerShell no %TEMP%
Get-ChildItem -Path $ENV:TEMP -File -Filter "*PowerShell*" -ErrorAction SilentlyContinue |
ForEach-Object {
    Remove-Item -Path $_.FullName -Force -ErrorAction SilentlyContinue
    Write-Output "Removido arquivo temporario: $($_.FullName)"
}

Write-Output "=== Limpeza completa do historico do PowerShell concluida! ==="