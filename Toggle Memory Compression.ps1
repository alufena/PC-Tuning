# Verifica o status atual da compressão de memória
$status = (Get-MMAgent).MemoryCompression

if ($status) {
    Write-Output "Memory Compression está ATIVADA."
} else {
    Write-Output "Memory Compression está DESATIVADA."
}

# Pergunta ao usuário se deseja alterar o estado atual
$opcao = Read-Host "Deseja alterar o estado? (S/N)"

if ($opcao -match "^S|s$") {
    if ($status) {
        Write-Output "Desativando Memory Compression..."
        Disable-MMAgent -mc
    } else {
        Write-Output "Ativando Memory Compression..."
        Enable-MMAgent -mc
    }

    # Aguarda um momento e verifica novamente
    Start-Sleep -Seconds 2
    $status_novo = (Get-MMAgent).MemoryCompression

    if ($status_novo) {
        Write-Output "Memory Compression agora está ATIVADA."
    } else {
        Write-Output "Memory Compression agora está DESATIVADA."
    }
} else {
    Write-Output "Nenhuma alteração feita. Saindo..."
}