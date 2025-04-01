fsutil behavior set disable8dot3 1
fsutil behavior set disablelastaccess 3
fsutil behavior set disableencryption 1
fsutil behavior set memoryusage 2
manage-bde -off C:
manage-bde -off D:
manage-bde -off E:
manage-bde -off F:
manage-bde -off G:
for %%a in ("SleepStudy" "Kernel-Processor-Power" "UserModePowerService") do (wevtutil sl Microsoft-Windows-%%a/Diagnostic /e:false)