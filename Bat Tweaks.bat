fsutil behavior set disable8dot3 1
fsutil behavior set disablelastaccess 1
fsutil behavior set disableencryption 1
fsutil behavior set memoryusage 2
fsutil behavior set encryptpagingfile 0
fsutil behavior set mftzone 4
manage-bde -off C:
manage-bde -off D:
manage-bde -off E:
manage-bde -off F:
manage-bde -off G:
for %%a in ("SleepStudy" "Kernel-Processor-Power" "UserModePowerService") do (wevtutil sl Microsoft-Windows-%%a/Diagnostic /e:false)
