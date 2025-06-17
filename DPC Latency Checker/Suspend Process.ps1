$processo = "dpclat.exe"

# Gets the process ID
$proc = Get-Process -Name ($processo -replace ".exe","") -ErrorAction SilentlyContinue
if (-not $proc) {
    Write-Output "Process $processo not found."
    exit
}

# Defines the function to suspend the process
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

# Gets the process handle and suspends it
$handle = [PInvoke]::OpenProcess(0x001F0FFF, $false, $proc.Id)
if ($handle -ne [IntPtr]::Zero) {
    [PInvoke]::NtSuspendProcess($handle) | Out-Null
    [PInvoke]::CloseHandle($handle)
    Write-Output "Process $processo suspended."
} else {
    Write-Output "Error obtaining process handle."
}
