# Script to completely clear PowerShell history - compatible with all encodings
# Removes old sessions, histories, and temporary files without interactivity

# Default history paths
$PSReadlinePath = "$ENV:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
$ISEHistoryPath = "$ENV:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\PSReadline_history.txt"
$ISEHistoryPath2 = "$ENV:USERPROFILE\Documents\WindowsPowerShell\PSReadline_history.xml"
$PS7HistoryPath = "$ENV:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\PowerShell_history.txt"

# Additional locations for old sessions and temp files
$AdditionalLocations = @(
    # ISE sessions and temporary files
    "$ENV:USERPROFILE\AppData\Local\Microsoft_Corporation\powershell_ise.exe*"
    "$ENV:USERPROFILE\AppData\Local\Microsoft\Windows\PowerShell\*"
    "$ENV:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\*"
    "$ENV:USERPROFILE\Documents\WindowsPowerShell\*"
    "$ENV:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\*"
    "$ENV:LOCALAPPDATA\Microsoft\Windows\PowerShell\*"
    
    # Histories saved in other possible locations
    "$ENV:USERPROFILE\AppData\Roaming\Microsoft\PowerShell\PSReadLine\*history*.txt"
    "$ENV:USERPROFILE\AppData\Local\Temp\*powershell*"
    "$ENV:USERPROFILE\AppData\Local\Microsoft\Windows\PowerShell\*"
    
    # Paths to .psxml files (session data)
    "$ENV:TEMP\*PowerShell*.psxml"
    "$ENV:TEMP\*ISE*.psxml"
    "$ENV:USERPROFILE\Documents\WindowsPowerShell\Sessions\*"
    
    # Files related to PowerShell ISE
    "$ENV:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell ISE\*"
    "$ENV:APPDATA\Microsoft\Windows\PowerShell ISE\*"
    "$ENV:LOCALAPPDATA\Microsoft\Windows\PowerShell ISE\*"
)

# Function to clear files with error handling
function Clear-HistoryFile {
    param($Path)
    if (Test-Path -Path $Path) {
        try {
            Write-Output "Clearing history file: $Path"
            # Use empty set to clear the file
            Set-Content -Path $Path -Value $null -Force -ErrorAction Stop
            Write-Output "History file successfully cleared: $Path"
        }
        catch {
            Write-Output "Error clearing file: $Path - $_"
            # Try alternative approach if first fails
            try {
                Remove-Item -Path $Path -Force -ErrorAction Stop
                Write-Output "File removed: $Path"
            }
            catch {
                Write-Output "Failed to remove file: $Path - $_"
            }
        }
    }
}

# Function to clear all files in a pattern
function Clear-HistoryPattern {
    param($Pattern)
    try {
        $files = Get-ChildItem -Path $Pattern -File -ErrorAction SilentlyContinue
        if ($files) {
            Write-Output "Clearing $($files.Count) files in: $Pattern"
            foreach ($file in $files) {
                try {
                    if ($file.Extension -eq ".xml" -or $file.Extension -eq ".psxml") {
                        # Completely remove XML/PSXML files
                        Remove-Item -Path $file.FullName -Force -ErrorAction Stop
                    }
                    else {
                        # Clear content of other files
                        Set-Content -Path $file.FullName -Value $null -Force -ErrorAction Stop
                    }
                    Write-Output "  Processed: $($file.Name)"
                }
                catch {
                    Write-Output "  Error processing $($file.Name): $_"
                    # Try to remove if unable to clear
                    Remove-Item -Path $file.FullName -Force -ErrorAction SilentlyContinue
                }
            }
        }
    }
    catch {
        Write-Output "Error processing pattern: $Pattern - $_"
    }
}

# Clear ISE registry
function Clear-ISERegistry {
    try {
        Write-Output "Clearing PowerShell ISE registry..."

        # Registry paths for ISE
        $regPaths = @(
            'HKCU:\Software\Microsoft\PowerShell\3\ISE',
            'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU'
        )

        foreach ($path in $regPaths) {
            if (Test-Path -Path $path) {
                # Clear keys related to history and recent files
                $keys = Get-Item -Path $path | Select-Object -ExpandProperty Property
                foreach ($key in $keys) {
                    if ($key -like "*MRU*" -or $key -like "*Recent*" -or $key -like "*History*") {
                        Remove-ItemProperty -Path $path -Name $key -Force -ErrorAction SilentlyContinue
                        Write-Output "  Removed registry key: $path\$key"
                    }
                }
            }
        }
    }
    catch {
        Write-Output "Error clearing registry: $_"
    }
}

# Clear main history files
Write-Output "=== Clearing main history files ==="
Clear-HistoryFile -Path $PSReadlinePath
Clear-HistoryFile -Path $ISEHistoryPath
Clear-HistoryFile -Path $ISEHistoryPath2
Clear-HistoryFile -Path $PS7HistoryPath

# Clear current session history
if (Get-Command "Clear-History" -ErrorAction SilentlyContinue) {
    Write-Output "=== Clearing current session history ==="
    Clear-History -ErrorAction SilentlyContinue
}

# Clear files in additional locations
Write-Output "=== Clearing old sessions and temporary files ==="
foreach ($location in $AdditionalLocations) {
    Clear-HistoryPattern -Pattern $location
}

# Clear module cache
Write-Output "=== Clearing module cache ==="
$ModuleCache = "$ENV:USERPROFILE\Documents\WindowsPowerShell\Modules"
if (Test-Path -Path $ModuleCache) {
    Get-ChildItem -Path $ModuleCache -Recurse -Filter "*.cache" | 
    ForEach-Object {
        Remove-Item -Path $_.FullName -Force -ErrorAction SilentlyContinue
        Write-Output "Removed cache: $($_.FullName)"
    }
}

# Clear ISE registry
Clear-ISERegistry

# Clear temporary ISE session folders
$TempISEFolders = Get-ChildItem -Path $ENV:TEMP -Directory -Filter "*ISE*" -ErrorAction SilentlyContinue
foreach ($folder in $TempISEFolders) {
    Write-Output "Removing temporary ISE folder: $($folder.FullName)"
    Remove-Item -Path $folder.FullName -Recurse -Force -ErrorAction SilentlyContinue
}

# Clear temporary PowerShell-related files in %TEMP%
Get-ChildItem -Path $ENV:TEMP -File -Filter "*PowerShell*" -ErrorAction SilentlyContinue |
ForEach-Object {
    Remove-Item -Path $_.FullName -Force -ErrorAction SilentlyContinue
    Write-Output "Removed temporary file: $($_.FullName)"
}

Write-Output "=== PowerShell history cleanup complete! ==="
