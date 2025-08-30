# Define device class GUIDs for Mouse and Keyboard
$deviceClasses = @(
    @{
        Path  = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e96f-e325-11ce-bfc1-08002be10318}";
        Label = "Mouse"
    },
    @{
        Path  = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e96b-e325-11ce-bfc1-08002be10318}";
        Label = "Keyboard"
    }
)

Write-Host "Starting check and patch for Mouse and Keyboard drivers..." -ForegroundColor Yellow

foreach ($class in $deviceClasses) {
    Write-Host "`n=== CHECKING $($class.Label) DRIVERS ===" -ForegroundColor Cyan

    # Get all numeric subkeys (e.g., 0000, 0001).
    # -ErrorAction SilentlyContinue is used to prevent access denied errors on protected
    # system subkeys like 'Properties', which we don't need to process anyway.
    $subKeys = Get-ChildItem -Path $class.Path -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -match "^\d{4}$" }

    if ($null -eq $subKeys) {
        Write-Host "[!] No driver subkeys found for $($class.Label)." -ForegroundColor Gray
        continue
    }

    foreach ($key in $subKeys) {
        $keyPath = $key.PSPath
        $keyName = $key.PSChildName
        
        try {
            # Attempt to read the 'DriverDateData' value
            $driverDataValue = (Get-ItemProperty -Path $keyPath -Name "DriverDateData" -ErrorAction Stop).DriverDateData

            # The value is a byte array. The index [-1] gets the last byte.
            $lastByte = $driverDataValue[-1]

            if ($lastByte -eq 0x01) {
                Write-Host "[+] $($class.Label) ($keyName): Last byte is 01. Modifying to 00..." -ForegroundColor Green
                
                # Create a modifiable clone of the byte array
                $newData = $driverDataValue.Clone()
                
                # Set the last byte to 00
                $newData[$newData.Length - 1] = 0x00
                
                # Write the new value back to the registry
                Set-ItemProperty -Path $keyPath -Name "DriverDateData" -Value $newData -Type Binary -Force
                
                Write-Host "[*] $($class.Label) ($keyName): Successfully patched." -ForegroundColor White
            }
            else {
                Write-Host "[-] $($class.Label) ($keyName): Last byte is already 0x$("{0:X2}" -f $lastByte). No changes needed." -ForegroundColor Gray
            }
        }
        catch [System.Management.Automation.ItemNotFoundException] {
            # This catches cases where the 'DriverDateData' property does not exist in the key
            Write-Host "[!] $($class.Label) ($keyName): Property 'DriverDateData' not found." -ForegroundColor DarkGray
        }
        catch {
            # This catches any other potential errors
            Write-Host "[X] ERROR processing $($class.Label) ($keyName): $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

Write-Host "`n[OK] Process finished." -ForegroundColor Yellow
Write-Host "A computer restart is highly recommended for the changes to take effect." -ForegroundColor Yellow

# Countdown timer before the window closes automatically
foreach ($i in 3..1) {
    # -NoNewline keeps the cursor on the same line. `r is a carriage return that moves it to the start.
    Write-Host -NoNewline "`rWindow will close automatically in $i second(s)..."
    Start-Sleep -Seconds 1
}

# The script will end here, and the PowerShell window will close.
