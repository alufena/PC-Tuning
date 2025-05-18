@echo off
chcp 65001 >nul
:: Disable Event Trace Sessions (ETS) - Ultra rápido, sem consultar antes

for %%X in (
    "NT Kernel Logger"
    "Phetrundownlogger"
    "Phetkernellogger"
    "UserNotPresentTraceSession"
    "UBPM"
    "Msdtc_Trace_Session"
    "Eventlog-Security"
    "EventLog-Application"
    "EventLog-System"
    "LwtNetLog"
    "NetCore"
    "NTFSLog"
    "RadioMgr"
    "WiFiSession"
    "Steam Event Tracing"
    "Scm"
    "Audio"
    "SqmLogger"
    "ReadyBoot"
    "WdiContextLog"
    "AitEventLog"
    "DiagLog"
    "Circular Kernel Context Logger"
    "Msmppssession7"
    "Wfp-Diag"
    "Energy-Trace"
    "UmStartup"
    "COM"
    "LogonUILog"
    "MpWppTracing-12312021-191912-00000003-ffffffff"
    "Microsoft-Windows-Rdp-Graphics-RdpIdd-Trace Trace"
    "SHS-07092022-024750-7-3f"
    "MpWppTracing-20220709-024352-00000003-ffffffff"
    "Diagtrack-Listener"
    "Admin_PS_Provider"
    "RzPresentMon"
) do (
    start "" /b cmd /c ^
    "logman stop %%X -ets >nul 2>&1 && echo [OK] Sessão %%X parada."
)

timeout /t 2 /nobreak
exit
