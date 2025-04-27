@echo off
chcp 65001 >nul
:: Disable Event Trace Sessions (ETS) - Ultra rápido, sem consultar antes

for %%X in (
    "NTFSLog"
    "WiFiDriverIHVSession"
    "WiFiDriverSession"
    "WiFiSession"
    "SleepStudyTraceSession"
    "1DSListener"
    "MpWppTracing"
    "NVIDIA-NVTOPPS-NoCat"
    "NVIDIA-NVTOPPS-Filter"
    "Circular Kernel Context Logger"
    "DiagLog"
    "LwtNetLog"
    "Microsoft-Windows-Rdp-Graphics-RdpIdd-Trace"
    "NetCore"
    "RadioMgr"
    "ReFSLog"
    "WdiContextLog"
    "ShadowPlay"
    "Eventlog-Security"
    "EventLog-Application"
    "UBPM"
    "GraphicsPerfMonitorSession"
    "F589D420-8B9A-40A2-95A8-DBB27ED17997"
    "BE235AAC-AC9D-4DDC-9FA6-D4C37AF837B7"
    "D425B399-4B71-4151-8DAF-413F92A75EC3"
    "UserNotPresentTraceSession"
    "WindowsUpdate_trace_log"
    "Steam Event Tracing"
) do (
    start "" /b cmd /c ^
    "logman stop %%X -ets >nul 2>&1 && echo [OK] Sessão %%X parada."
)

timeout /t 2 /nobreak

exit
