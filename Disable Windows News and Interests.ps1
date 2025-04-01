# https://forums.mydigitallife.net/threads/taskbarda-widgets-registry-change-is-now-blocked.88547/#post-1849006
# jeff789741

$MethodDefinition = @'
[DllImport("Shlwapi.dll", CharSet = CharSet.Unicode, ExactSpelling = true, SetLastError = false)]
public static extern int HashData(
    byte[] pbData,
    int cbData,
    byte[] piet,
    int outputLen);
'@
$Shlwapi = Add-Type -MemberDefinition $MethodDefinition -Name 'Shlwapi' -Namespace 'Win32' -PassThru

# (2 is for off)
$option = 2

$machineIdReg = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\SQMClient\' -Name 'MachineId' -ErrorAction SilentlyContinue
$machineId = '{C283D224-5CAD-4502-95F0-2569E4C85074}' # Fallback Value

if ($machineIdReg) {
    $machineId = $machineIdReg.MachineId
}

$combined = $machineId + '_' + $option.ToString()
$reverse = $combined[($combined.Length - 1)..0] -join ''
$bytesIn = [system.Text.Encoding]::Unicode.GetBytes($reverse)
$bytesOut = [byte[]]::new(4)
$Shlwapi::HashData($bytesIn, 0x53, $bytesOut, $bytesOut.Count)

$dwordData = [System.BitConverter]::ToUInt32($bytesOut,0)

Copy-Item (Get-Command reg).Source .\reg1.exe

Start-Process -NoNewWindow -Wait -FilePath .\reg1.exe -ArgumentList 'ADD','HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds\','/v','ShellFeedsTaskbarViewMode','/t','REG_DWORD','/d',$option,'/f'
Start-Process -NoNewWindow -Wait -FilePath .\reg1.exe -ArgumentList 'ADD','HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds\','/v','EnShellFeedsTaskbarViewMode','/t','REG_DWORD','/d',$dwordData,'/f'
Remove-Item -Path .\reg1.exe -Force