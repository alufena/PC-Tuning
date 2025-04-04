$status = (Get-MMAgent).MemoryCompression
if ($status) {
    Write-Output "Memory Compression is ENABLED."
} else {
    Write-Output "Memory Compression is DISABLED."
}

$option = Read-Host "Do you want to change the state? (Y/N)"
if ($option -match "^Y|y$") {
    if ($status) {
        Write-Output "Disabling Memory Compression..."
        Disable-MMAgent -mc
    } else {
        Write-Output "Enabling Memory Compression..."
        Enable-MMAgent -mc
    }
    
    Start-Sleep -Seconds 2
    $new_status = (Get-MMAgent).MemoryCompression
    if ($new_status) {
        Write-Output "Memory Compression is now ENABLED."
    } else {
        Write-Output "Memory Compression is now DISABLED."
    }
} else {
    Write-Output "No changes were made."
}
