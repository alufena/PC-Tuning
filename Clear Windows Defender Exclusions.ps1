# PowerShell script to clear the ExclusionPath, ExclusionProcess, and ExclusionExtension
# associated with Windows Defender Antivirus

# Start transcript
$Logs = "C:\temp\Clear-WindowsDefenderExcl.txt"
Start-Transcript $Logs -Append -Force

# Get Windows Defender preferences
$x = Get-MpPreference

# Get exclusion path
if ($x.ExclusionPath -ne $NULL) {
    Write-Host("================================================")
    Write-Host("Removing the following ExclusionPath entries:")
    foreach ($i in $x.ExclusionPath) {
        Remove-MpPreference -ExclusionPath $i
        Write-Host($i)
    }
    Write-Host("================================================")
    Write-Host("Total ExclusionPath entries deleted:", $x.ExclusionPath.Count)
}
else {
    Write-Host("No ExclusionPath entries present. Skipping...")
}

# Get exclusion process
if ($x.ExclusionProcess -ne $NULL) {
    Write-Host("================================================")
    Write-Host("Removing the following ExclusionProcess entries:")
    foreach ($i in $x.ExclusionProcess) {
        Remove-MpPreference -ExclusionProcess $i
        Write-Host($i)
    }
    Write-Host("================================================")
    Write-Host("Total ExclusionProcess entries deleted:", $x.ExclusionProcess.Count)
}
else {
    Write-Host("No ExclusionProcess entries present. Skipping...")
}

# Get exclusion extension
if ($x.ExclusionExtension -ne $NULL) {
    Write-Host("================================================")
    Write-Host("Removing the following ExclusionExtension entries:")
    foreach ($i in $x.ExclusionExtension) {
        Remove-MpPreference -ExclusionExtension $i
        Write-Host($i)
    }
    Write-Host("================================================")
    Write-Host("Total ExclusionExtension entries deleted:", $x.ExclusionExtension.Count)
}
else {
    Write-Host("No ExclusionExtension entries present. Skipping...")
}

# Summary
Write-Host("================================================")
Write-Host("SUMMARY")
Write-Host($x.ExclusionPath.Count, "ExclusionPath entries deleted.")
Write-Host($x.ExclusionProcess.Count, "ExclusionProcess entries deleted.")
Write-Host($x.ExclusionProcess.Count, "ExclusionExtension entries deleted.")
Write-Host(($x.ExclusionPath.Count + $x.ExclusionProcess.Count + $x.ExclusionExtension.Count), "Total entries deleted")
Write-Host("")
Write-Host("Done.")
Stop-Transcript