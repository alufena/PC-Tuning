netsh int 6to4 set state disabled
netsh int ip set global loopbackworkercount=16
netsh int ip set global neighborcachelimit=4096
netsh int ip set global taskoffload=disabled
netsh int ip set interface ethernet currenthoplimit=64
netsh int isatap set state disabled
netsh int tcp set global autotuninglevel=normal # disabled/normal
netsh int tcp set global dca=disabled # disabled/enabled
netsh int tcp set global ecncapability=disabled # disabled/enabled
netsh int tcp set global fastopen=enabled
netsh int tcp set global fastopenfallback=enabled
netsh int tcp set global hystart=enabled
netsh int tcp set global initialRto=2000 # 2000/3000
netsh int tcp set global maxsynretransmissions=2
netsh int tcp set global netdma=enabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set global pacingprofile=always
netsh int tcp set global rsc=disabled # disabled/enabled
netsh int tcp set global rss=enabled
netsh int tcp set global timestamps=disabled
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled
netsh int tcp set supplemental internet congestionprovider=ctcp # ctcp/dctcp
# netsh int tcp set supplemental internet congestionprovider=dctcp
netsh int tcp set supplemental internet enablecwndrestart=enabled
netsh int teredo set state disabled

# w11 only
# netsh int tcp set supplemental Template=Automatic CongestionProvider=cubic
# netsh int tcp set supplemental Template=Compat CongestionProvider=bbr2
# netsh int tcp set supplemental Template=Compat CongestionProvider=cubic
# netsh int tcp set supplemental Template=Datacenter CongestionProvider=bbr2
# netsh int tcp set supplemental Template=Datacenter CongestionProvider=cubic
# netsh int tcp set supplemental Template=DatacenterCustom CongestionProvider=bbr2
# netsh int tcp set supplemental Template=DatacenterCustom CongestionProvider=cubic
# netsh int tcp set supplemental Template=Internet CongestionProvider=bbr2
# netsh int tcp set supplemental Template=Internet CongestionProvider=cubic
# netsh int tcp set supplemental Template=InternetCustom CongestionProvider=bbr2
# netsh int tcp set supplemental Template=InternetCustom CongestionProvider=cubic

Set-NetTCPSetting -SettingName "*" -AutoTuningLevelLocal Normal -ScalingHeuristics Disabled -MinRto 300

Set-NetTCPSetting -SettingName "*" -MinRto 300

Disable-NetAdapterPowerManagement -Name "*"
Disable-NetAdapterLso -Name "*"
Disable-NetAdapterBinding -Name "*" -ComponentID ms_pacer

# If you share files on the network, DO NOT disable the client below
Disable-NetAdapterBinding -Name "*" -ComponentID ms_msclient

Set-NetOffloadGlobalSetting -PacketCoalescingFilter disabled -Chimney Disabled -Taskoffload Disabled -ReceiveSideScaling Enabled -ReceiveSegmentCoalescing Disabled # Taskoffload Disabled/Enabled

Set-NetAdapterRdma -Name "*" -Enabled $True
Set-NetAdapterRss -Name "*" -Profile Conservative
Set-NetAdapterIPsecOffload -Name "*" -Enabled $True
Enable-NetAdapterChecksumOffload -Name "*" # Disable/Enable
Enable-NetAdapterEncapsulatedPacketTaskOffload -Name "*" # Disable/Enable
Enable-NetAdapterIPsecOffload -Name "*" # Disable/Enable
Disable-NetAdapterQos -Name "*" # Disable/Enable
Disable-NetAdapterRsc -Name "*" # Disable/Enable
Enable-NetAdapterRss -Name "*"
Enable-NetAdapterSriov -Name "*" # Disable/Enable
Enable-NetAdapterVmq -Name "*" # Disable/Enable

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

$tcpipPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"
$tcpInterfaces = Get-ChildItem -Path $tcpipPath
foreach ($interface in $tcpInterfaces) {
    Set-RegKey -path $interface.PSPath -name "TCPNoDelay" -value 1
    Set-RegKey -path $interface.PSPath -name "TcpAckFrequency" -value 1
    Set-RegKey -path $interface.PSPath -name "TcpDelAckTicks" -value 0
}

$netbtPath = "HKLM:\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces"
$interfaces = Get-ChildItem -Path $netbtPath
foreach ($interface in $interfaces) {
    Set-RegKey -path $interface.PSPath -name "NetbiosOptions" -value 2
}

$driverPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"
$networkInterfaces = Get-ChildItem -Path $driverPath
foreach ($interface in $networkInterfaces) {

    Set-RegKey -path $interface.PSPath -name "*FlowControl" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "FlowControlCap" -value "0" -type "String"

    Set-RegKey -path $interface.PSPath -name "TxIntDelay" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "TxAbsIntDelay" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "RxIntDelay" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "RxAbsIntDelay" -value "0" -type "String"

    Set-RegKey -path $interface.PSPath -name "*InterruptModeration" -value "0" -type "String"

    Set-RegKey -path $interface.PSPath -name "*EEE" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "AdvancedEEE" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "AutoPowerSaveModeEnabled" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "EnableEDT" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "EnableGreenEthernet" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "PowerSavingMode" -value "0" -type "String"
    Set-RegKey -path $interface.PSPath -name "ULPMode" -value "0" -type "String"
}

Disable-NetAdapterBinding -Name "*" -DisplayName 'Client for Microsoft Networks'
Disable-NetAdapterBinding -Name "*" -DisplayName 'File and Printer Sharing for Microsoft Networks'
Disable-NetAdapterQos -Name "*"
Disable-NetAdapterBinding -Name "*" -DisplayName 'Microsoft Network Adapter Multiplexor Protocol'
Disable-NetAdapterBinding -Name "*" -DisplayName 'Microsoft LLDP Protocol Driver'
Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6
Disable-NetAdapterBinding -Name "*" -DisplayName 'Link-Layer Topology Discovery Responder'
Disable-NetAdapterBinding -Name "*" -DisplayName 'Link-Layer Topology Discovery Mapper I/O Driver'

exit
