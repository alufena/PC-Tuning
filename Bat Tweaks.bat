fsutil behavior set allowextchar 0
fsutil behavior set disable8dot3 1
fsutil behavior set DisableCompression 1
fsutil behavior set disableencryption 1
fsutil behavior set disablelastaccess 1
fsutil behavior set encryptpagingfile 0
::fsutil behavior set memoryusage 1
fsutil behavior set memoryusage 2
fsutil behavior set mftzone 4
fsutil behavior set quotanotify 4294967295
fsutil behavior set disabledeletenotify 0
manage-bde -off C:
manage-bde -off D:
manage-bde -off E:
manage-bde -off F:
manage-bde -off G:
for %%a in ("SleepStudy" "Kernel-Processor-Power" "UserModePowerService") do (wevtutil sl Microsoft-Windows-%%a/Diagnostic /e:false)
takeown /f "%SystemRoot%\System32\drivers\Acpidev.sys"
takeown /f "%SystemRoot%\System32\drivers\Acpipagr.sys"
takeown /f "%SystemRoot%\System32\drivers\Acpitime.sys"
takeown /f "%SystemRoot%\System32\drivers\Acpipmi.sys"
icacls "%SystemRoot%\System32\drivers\Acpidev.sys" /grant %username%:F
icacls "%SystemRoot%\System32\drivers\Acpipagr.sys" /grant %username%:F
icacls "%SystemRoot%\System32\drivers\Acpitime.sys" /grant %username%:F
icacls "%SystemRoot%\System32\drivers\Acpipmi.sys" /grant %username%:F
del /f /q "%SystemRoot%\System32\drivers\Acpidev.sys"
del /f /q "%SystemRoot%\System32\drivers\Acpipagr.sys"
del /f /q "%SystemRoot%\System32\drivers\Acpitime.sys"
del /f /q "%SystemRoot%\System32\drivers\Acpipmi.sys"
takeown /f "C:\Windows\System32\mcupdate_GenuineIntel.dll"
takeown /f "C:\Windows\System32\mcupdate_AuthenticAMD.dll"
icacls "%SystemRoot%\System32\mcupdate_GenuineIntel.dll" /grant %username%:F
icacls "%SystemRoot%\System32\mcupdate_AuthenticAMD.dll" /grant %username%:F
del "C:\Windows\System32\mcupdate_GenuineIntel.dll"
del "C:\Windows\System32\mcupdate_AuthenticAMD.dll"
powercfg -change monitor-timeout-ac 0
powercfg -change standby-timeout-ac 0
powercfg -change hibernate-timeout-ac 0
powercfg -change disk-timeout-ac 0
powercfg -change monitor-timeout-dc 0
powercfg -change standby-timeout-dc 0
powercfg -change hibernate-timeout-dc 0
powercfg -change disk-timeout-dc 0
powercfg -setacvalueindex SCHEME_CURRENT SUB_SLEEP STANDBYIDLE 0
powercfg -setdcvalueindex SCHEME_CURRENT SUB_SLEEP STANDBYIDLE 0
powercfg setdcvalueindex scheme_current sub_sleep hybridsleep 0
powercfg setacvalueindex scheme_current sub_sleep hybridsleep 0
powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ee12f906-d277-404b-b6da-e5fa1a576df5 0
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ee12f906-d277-404b-b6da-e5fa1a576df5 0
::powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 0
::powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 0
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 4b92d758-5a24-4851-a470-815d78aee119 100
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR 4b92d758-5a24-4851-a470-815d78aee119 100
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 7b224883-b3cc-4d79-819f-8374152cbe7c 100
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR 7b224883-b3cc-4d79-819f-8374152cbe7c 100
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c 1
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c 1
powercfg -setacvalueindex scheme_current SUB_DISK dbc9e238-6de9-49e3-92cd-8c2b4946b472 1
powercfg -setacvalueindex scheme_current SUB_DISK fc95af4d-40e7-4b6d-835a-56d131dbc80e 1
powercfg /SETACVALUEINDEX SCHEME_CURRENT 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 1
powercfg /SETACVALUEINDEX SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 d639518a-e56d-4345-8af2-b9f32fb26109 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 d3d55efd-c1ff-424e-9dc3-441be7833010 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 0853a681-27c8-4100-a2fd-82013e970683 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 0
::powercfg /SETACVALUEINDEX SCHEME_CURRENT 48672f38-7a9a-4bb2-8bf8-3d85be19de4e d6ba4903-386f-4c2c-8adb-5c21b3328d25 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 48672f38-7a9a-4bb2-8bf8-3d85be19de4e 2bfc24f9-5ea2-4801-8213-3dbae01aa39d 6
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 25dfa149-5dd1-4736-b5ab-e8a37b5b8187 0
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg -setactive SCHEME_CURRENT
exit
