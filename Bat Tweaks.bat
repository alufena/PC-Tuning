fsutil behavior set disable8dot3 1
fsutil behavior set DisableCompression 1
fsutil behavior set disableencryption 1
fsutil behavior set disablelastaccess 1
fsutil behavior set encryptpagingfile 0
fsutil behavior set memoryusage 2
fsutil behavior set mftzone 4
manage-bde -off C:
manage-bde -off D:
manage-bde -off E:
manage-bde -off F:
manage-bde -off G:
for %%a in ("SleepStudy" "Kernel-Processor-Power" "UserModePowerService") do (wevtutil sl Microsoft-Windows-%%a/Diagnostic /e:false)
takeown /f %SystemRoot%\System32\drivers\Acpidev.sys
takeown /f %SystemRoot%\System32\drivers\Acpipagr.sys
takeown /f %SystemRoot%\System32\drivers\Acpitime.sys
takeown /f %SystemRoot%\System32\drivers\Acpipmi.sys
icacls %SystemRoot%\System32\drivers\Acpidev.sys /grant %username%:F
icacls %SystemRoot%\System32\drivers\Acpipagr.sys /grant %username%:F
icacls %SystemRoot%\System32\drivers\Acpitime.sys /grant %username%:F
icacls %SystemRoot%\System32\drivers\Acpipmi.sys /grant %username%:F
del /f /q %SystemRoot%\System32\drivers\Acpidev.sys
del /f /q %SystemRoot%\System32\drivers\Acpipagr.sys
del /f /q %SystemRoot%\System32\drivers\Acpitime.sys
del /f /q %SystemRoot%\System32\drivers\Acpipmi.sys
exit
