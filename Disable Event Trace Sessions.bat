@echo off
:: Disable Event Trace Sessions (ETS)
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
    "GraphicsPerfMonitorSession"
    "UBPM"
    "UserNotPresentTraceSession"
    "WindowsUpdate_trace_log"
    "Steam Event Tracing"

) do (
    logman stop %%X -ets
)
exit
