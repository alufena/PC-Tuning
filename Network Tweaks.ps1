# ------------------------------
# NETSH & TCP GLOBAL SETTINGS
# ------------------------------
netsh interface tcp set supplemental Internet congestionprovider=ctcp
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh int tcp set global ecncapability=enabled
netsh int tcp set global fastopen=enabled
netsh int tcp set global fastopenfallback=enabled
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=enabled
netsh int tcp set global pacingprofile=always
netsh int tcp set global hystart=enabled
netsh int tcp set global autotuninglevel=experimental
netsh int tcp set supplemental internet enablecwndrestart=enabled
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh int tcp set security mpp=enabled
netsh int ip set global neighborcachelimit=4096 taskoffload=enabled
netsh int isatap set state disabled

# ------------------------------
# NETTCPSETTINGS (Modern API)
# ------------------------------
Set-NetTCPSetting -SettingName * -AutoTuningLevelLocal Experimental -ScalingHeuristics Disabled
# Note: The line below caused an error in previous attempts because InitialCongestionWindow is read-only on modern Windows versions.
# Set-NetTCPSetting -SettingName * -InitialCongestionWindow 10 -InitialRto 3000 -Timestamps Disabled -MemoryPressureProtection Disabled -NonSackRttResiliency Disabled -MaxSynRetransmissions 2

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

# NetBIOS: Disable for less local overhead
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
