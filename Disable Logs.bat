powershell Disable-AppBackgroundTaskDiagnosticLog
Auditpol /set /subcategory:"Process Termination" /success:disable /failure:enable
Auditpol /set /subcategory:"RPC Events" /success:disable /failure:enable
Auditpol /set /subcategory:"Filtering Platform Connection" /success:disable /failure:enable
Auditpol /set /subcategory:"DPAPI Activity" /success:disable /failure:disable
Auditpol /set /subcategory:"IPsec Driver" /success:disable /failure:enable
Auditpol /set /subcategory:"Other System Events" /success:disable /failure:enable
Auditpol /set /subcategory:"Security State Change" /success:disable /failure:enable
Auditpol /set /subcategory:"Security System Extension" /success:disable /failure:enable
Auditpol /set /subcategory:"System Integrity" /success:disable /failure:enable
exit