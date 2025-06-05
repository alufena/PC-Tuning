# ------------------------------
# NETSH & TCP GLOBAL SETTINGS
# ------------------------------
netsh interface tcp set supplemental Internet congestionprovider=ctcp
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global fastopen=enabled
netsh int tcp set global fastopenfallback=enabled
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh int tcp set global pacingprofile=always
netsh int tcp set global hystart=enabled
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set supplemental internet enablecwndrestart=enabled
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh int tcp set security mpp=enabled
netsh int ip set global neighborcachelimit=4096 taskoffload=disabled
NETSH interface teredo set state disabled
NETSH interface 6to4 set state disabled
NETSH int ip set global loopbackworkercount=16
NETSH int tcp set global nonsackrttresiliency=disabled
NETSH int tcp set global timestamps=disabled
NETSH int tcp set security profiles=disabled
NETSH int tcp set global initialRto=3000
NETSH int tcp set global maxsynretransmissions=2
netsh int isatap set state disabled

# ------------------------------
# NETTCPSETTINGS (Modern API)
# ------------------------------
Set-NetTCPSetting -SettingName * -AutoTuningLevelLocal Disable -ScalingHeuristics Disabled

# ------------------------------
# NETWORK ADAPTER SETTINGS
# ------------------------------
Disable-NetAdapterPowerManagement *
Disable-NetAdapterLso -Name *
Disable-NetAdapterBinding -Name * -ComponentID ms_pacer

# If you share files on the network, DO NOT disable the client below
Disable-NetAdapterBinding -Name * -ComponentID ms_msclient

# Offload Settings — some enabled for network performance, others disabled for stability
Set-NetOffloadGlobalSetting -PacketCoalescingFilter disabled -Chimney Disabled -Taskoffload Enabled -ReceiveSideScaling Enabled -ReceiveSegmentCoalescing Disabled

Set-NetAdapterRdma -Name "*" -Enabled $True
Set-NetAdapterRss -Name "*" -Profile Conservative
Set-NetAdapterIPsecOffload -Name "*" -Enabled $True
Enable-NetAdapterChecksumOffload -Name "*"
Enable-NetAdapterIPsecOffload -Name "*"
Enable-NetAdapterRsc -Name "*"
Enable-NetAdapterRss -Name "*"
Enable-NetAdapterQos -Name "*"
Enable-NetAdapterEncapsulatedPacketTaskOffload -Name "*"
Enable-NetAdapterSriov -Name "*"
Enable-NetAdapterVmq -Name "*"

# ------------------------------
# TCP/IP REGISTRY SETTINGS
# ------------------------------
function Set-RegKey {
    param (
        [string]$path,
        [string]$name,
        [string]$value,
        [string]$type = "DWord"
    )
    if ($type -eq "DWord") {
        Set-ItemProperty -Path $path -Name $name -Value $value -Type DWord -Force
    } else {
        Set-ItemProperty -Path $path -Name $name -Value $value -Type String -Force
    }
}

# Disable Nagle and ACK delay
$tcpipPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"
$tcpInterfaces = Get-ChildItem -Path $tcpipPath
foreach ($interface in $tcpInterfaces) {
    Set-RegKey -path $interface.PSPath -name "TCPNoDelay" -value 1
    Set-RegKey -path $interface.PSPath -name "TcpAckFrequency" -value 1
    Set-RegKey -path $interface.PSPath -name "TcpDelAckTicks" -value 0
}

# NetBIOS: Disable for reduced local overhead
$netbtPath = "HKLM:\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces"
$interfaces = Get-ChildItem -Path $netbtPath
foreach ($interface in $interfaces) {
    Set-RegKey -path $interface.PSPath -name "NetbiosOptions" -value 2
}

# ------------------------------
# DRIVER-SPECIFIC NIC TWEAKS
# ------------------------------
$driverPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"
$networkInterfaces = Get-ChildItem -Path $driverPath
foreach ($interface in $networkInterfaces) {
    # Flow Control
    Set-RegKey -path $interface.PSPath -name "*FlowControl" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "FlowControlCap" -value "0" -type "String"

    # Interrupt Delay (Intel NICs)
    Set-RegKey -path $interface.PSPath -name "TxIntDelay" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "TxAbsIntDelay" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "RxIntDelay" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "RxAbsIntDelay" -value "0" -type "String"

    # Interrupt Moderation
    Set-RegKey -path $interface.PSPath -name "*InterruptModeration" -value "0" -type "String"

    # Green Ethernet and power-saving
    Set-RegKey -path $interface.PSPath -name "*EEE" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "AdvancedEEE" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "AutoPowerSaveModeEnabled" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "EnableEDT" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "EnableGreenEthernet" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "PowerSavingMode" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "ULPMode" -value "0" -type "String"
}

# ------------------------------
# OPTIONAL: ENABLE DCTCP PROFILES
# ------------------------------
# netsh int tcp set supplemental internet congestionprovider=dctcp
