$processo = "dpclat.exe"

# Obtém o ID do processo
$proc = Get-Process -Name ($processo -replace ".exe","") -ErrorAction SilentlyContinue
if (-not $proc) {
    Write-Output "Processo $processo não encontrado."
    exit
}

# Define a função para suspender o processo
$signature = @"
using System;
using System.Runtime.InteropServices;

public class PInvoke {
    [DllImport("ntdll.dll", SetLastError = true)]
    public static extern uint NtSuspendProcess(IntPtr ProcessHandle);

    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern IntPtr OpenProcess(int dwDesiredAccess, bool bInheritHandle, int dwProcessId);

    [DllImport("kernel32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool CloseHandle(IntPtr hObject);
}
"@

Add-Type -TypeDefinition $signature -Language CSharp

# Obtém o handle do processo e o suspende
$handle = [PInvoke]::OpenProcess(0x001F0FFF, $false, $proc.Id)
if ($handle -ne [IntPtr]::Zero) {
    [PInvoke]::NtSuspendProcess($handle) | Out-Null
    [PInvoke]::CloseHandle($handle)
    Write-Output "Processo $processo suspenso."
} else {
    Write-Output "Erro ao obter handle do processo."
}
