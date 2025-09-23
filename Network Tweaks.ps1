netsh advfirewall firewall set rule group="Network Discovery" new enable=No
Set-NetFirewallRule -Group '*-32752*' -Enabled 'False'
Get-NetFirewallRule -Group '*-32752*' | Where-Object 'Profile' -Match 'Public' | Set-NetFirewallRule -Enabled 'False'
Get-NetFirewallRule -Group '*-32752*' | Where-Object 'Profile' -Match 'Private' | Set-NetFirewallRule -Enabled 'False'
Get-NetFirewallRule -Group '*-32752*' | Where-Object 'Profile' -Match 'Domain' | Set-NetFirewallRule -Enabled 'False'
netsh int 6to4 set state disabled
netsh int ip set global loopbackworkercount=16
netsh int ip set global neighborcachelimit=4096
netsh int ip set global taskoffload=enabled # disabled/enabled
netsh int ip set interface ethernet currenthoplimit=64 # 0/40/64/128
netsh int ipv4 set glob defaultcurhoplimit=64
netsh int ipv6 set glob defaultcurhoplimit=64
netsh int isatap set state disabled
netsh int tcp set global autotuninglevel=normal # disabled/normal
netsh int tcp set global chimney=disabled
netsh int tcp set global congestionprovider=dctcp # cubic/default/ctcp/dctcp
netsh int tcp set global dca=disabled # disabled/enabled
netsh int tcp set global ecncapability=enabled # disabled/enabled 
netsh int tcp set global fastopen=enabled
netsh int tcp set global fastopenfallback=enabled
netsh int tcp set global hystart=disabled # disabled/enabled
netsh int tcp set global initialRto=2000 # 300/2000/3000
netsh int tcp set global maxsynretransmissions=3 # 2/3/4
netsh int tcp set global netdma=enabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set global pacingprofile=always # off/always
netsh int tcp set global prr=disabled # disabled/enabled
netsh int tcp set global rsc=disabled # disabled/enabled
netsh int tcp set global rss=enabled
netsh int tcp set global timestamps=disabled # disabled/enabled
netsh int tcp set heuristics wsh=disabled forcews=enabled
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled
netsh int tcp set supplemental internet congestionprovider=dctcp # cubic/newreno/ctcp/dctcp
netsh int tcp set supplemental internet enablecwndrestart=enabled
netsh int tcp set supplemental template=custom icw=10 # 2/10
netsh int teredo set state disabled
netsh int udp set global uro=disabled
netsh int udp set global uso=disabled
netsh winsock set autotuning on

netsh interface tcp set supplemental template=automatic congestionprovider=dctcp
netsh interface tcp set supplemental template=automatic delayedackfrequency=1
netsh interface tcp set supplemental template=automatic delayedacktimeout=10
netsh interface tcp set supplemental template=automatic enablecwndrestart=enabled
netsh interface tcp set supplemental template=automatic icw=10
netsh interface tcp set supplemental template=automatic minrto=300
netsh interface tcp set supplemental template=automatic rack=enabled
netsh interface tcp set supplemental template=automatic taillossprobe=enabled

netsh interface tcp set supplemental template=datacenter congestionprovider=dctcp
netsh interface tcp set supplemental template=datacenter delayedackfrequency=1
netsh interface tcp set supplemental template=datacenter delayedacktimeout=10
netsh interface tcp set supplemental template=datacenter enablecwndrestart=enabled
netsh interface tcp set supplemental template=datacenter icw=10
netsh interface tcp set supplemental template=datacenter minrto=300
netsh interface tcp set supplemental template=datacenter rack=enabled
netsh interface tcp set supplemental template=datacenter taillossprobe=enabled

netsh interface tcp set supplemental template=internet congestionprovider=dctcp
netsh interface tcp set supplemental template=internet delayedackfrequency=1
netsh interface tcp set supplemental template=internet delayedacktimeout=10
netsh interface tcp set supplemental template=internet enablecwndrestart=enabled
netsh interface tcp set supplemental template=internet icw=10
netsh interface tcp set supplemental template=internet minrto=300
netsh interface tcp set supplemental template=internet rack=enabled
netsh interface tcp set supplemental template=internet taillossprobe=enabled

netsh interface tcp set supplemental template=compat congestionprovider=dctcp
netsh interface tcp set supplemental template=compat delayedackfrequency=1
netsh interface tcp set supplemental template=compat delayedacktimeout=10
netsh interface tcp set supplemental template=compat enablecwndrestart=enabled
netsh interface tcp set supplemental template=compat icw=10
netsh interface tcp set supplemental template=compat minrto=300
netsh interface tcp set supplemental template=compat rack=enabled
netsh interface tcp set supplemental template=compat taillossprobe=enabled

netsh interface tcp set supplemental template=custom congestionprovider=dctcp
netsh interface tcp set supplemental template=custom delayedackfrequency=1
netsh interface tcp set supplemental template=custom delayedacktimeout=10
netsh interface tcp set supplemental template=custom enablecwndrestart=enabled
netsh interface tcp set supplemental template=custom icw=2
netsh interface tcp set supplemental template=custom minrto=300
netsh interface tcp set supplemental template=custom rack=enabled
netsh interface tcp set supplemental template=custom taillossprobe=enabled

netsh int tcp set supplemental Template=InternetCustom CongestionProvider=dctcp # cubic/bbr2/BBR/ctcp/dctcp/NewReno

Disable-NetAdapterBinding -Name "*" -ComponentId 'ms_implat'
Disable-NetAdapterBinding -Name "*" -ComponentId 'ms_lldp'
Disable-NetAdapterBinding -Name "*" -ComponentId 'ms_lltdio'
Disable-NetAdapterBinding -Name "*" -ComponentId 'ms_msclient' # If you share files on the network, DO NOT disable the client
Disable-NetAdapterBinding -Name "*" -ComponentId 'ms_pacer'
Disable-NetAdapterBinding -Name "*" -ComponentId 'ms_rspndr'
Disable-NetAdapterBinding -Name "*" -ComponentId 'ms_server'
Disable-NetAdapterBinding -Name "*" -ComponentId 'ms_tcpip6'
Disable-NetAdapterBinding -Name "*" -ComponentId 'vmware_bridge'
Disable-NetAdapterBinding -Name "*" -DisplayName 'Client for Microsoft Networks'
Disable-NetAdapterBinding -Name "*" -DisplayName 'File and Printer Sharing for Microsoft Networks'
Disable-NetAdapterBinding -Name "*" -DisplayName 'Link-Layer Topology Discovery Mapper I/O Driver'
Disable-NetAdapterBinding -Name "*" -DisplayName 'Link-Layer Topology Discovery Responder'
Disable-NetAdapterBinding -Name "*" -DisplayName 'Microsoft LLDP Protocol Driver'
Disable-NetAdapterBinding -Name "*" -DisplayName 'Microsoft Network Adapter Multiplexor Protocol'
# Disable-NetAdapterChecksumOffload -Name "*"
Disable-NetAdapterEncapsulatedPacketTaskOffload -Name '*'
Disable-NetAdapterIPsecOffload -Name '*'
Disable-NetAdapterLso -Name "*"
Disable-NetAdapterPowerManagement -Name "*"
Disable-NetAdapterQos -Name "*"
Disable-NetAdapterRdma -Name '*'
Disable-NetAdapterRsc -Name "*"
Disable-NetAdapterSriov -Name '*'
Disable-NetAdapterUso -Name '*'
Disable-NetAdapterVmq -Name '*'
Enable-NetAdapterChecksumOffload -Name "*"
# Enable-NetAdapterEncapsulatedPacketTaskOffload -Name "*"
# Enable-NetAdapterIPsecOffload -Name "*"
# Enable-NetAdapterQos -Name "*"
# Enable-NetAdapterRsc -Name "*"
Enable-NetAdapterRss -Name "*"
# Enable-NetAdapterSriov -Name "*"
# Enable-NetAdapterVmq -Name "*"
Set-NetAdapterDataPathConfiguration -Name '*' -IncludeHidden -Profile Dispatch
Set-NetAdapterIPsecOffload -Name "*" -Enabled $True
# Set-NetAdapterRdma -Name "*" -Enabled $True
# Set-NetAdapterRss -Name '*' -IncludeHidden -NumberOfReceiveQueues 1 -Profile Conservative -BaseProcessorGroup 0 -BaseProcessorNumber 0 -MaxProcessorGroup 0 -MaxProcessorNumber 0 -MaxProcessors 1 -NumaNode 0 -Enabled $true
Set-NetAdapterRss -Name "*" -Profile Conservative
Set-NetOffloadGlobalSetting -Chimney Disabled
Set-NetOffloadGlobalSetting -NetworkDirectAcrossIPSubnets Blocked 
Set-NetOffloadGlobalSetting -NetworkDirect Disabled
Set-NetOffloadGlobalSetting -PacketCoalescingFilter Disabled
Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing Disabled
# Set-NetOffloadGlobalSetting -ReceiveSideScaling Disabled
Set-NetOffloadGlobalSetting -ReceiveSideScaling Enabled
# Set-NetOffloadGlobalSetting -Taskoffload Disabled
Set-NetOffloadGlobalSetting -Taskoffload Enabled
Set-NetTCPSetting -SettingName "*" -AutoTuningLevelLocal Normal
Set-NetTCPSetting -SettingName internet -MinRto 300 # 20/300
Set-NetTCPSetting -SettingName "*" -ScalingHeuristics Disabled
Set-NetUDPSetting -DynamicPortRangeNumberOfPorts 5000
Set-NetUDPSetting -DynamicPortRangeStartPort 60000

Set-NetIPv4Protocol -AddressMaskReply Disabled
Set-NetIPv4Protocol -DeadGatewayDetection Enabled
Set-NetIPv4Protocol -DefaultHopLimit 128
Set-NetIPv4Protocol -DhcpMediaSense Disabled
Set-NetIPv4Protocol -GroupForwardedFragments Disabled
Set-NetIPv4Protocol -IcmpRedirects Disabled
Set-NetIPv4Protocol -IGMPLevel All
Set-NetIPv4Protocol -IGMPVersion Version3
Set-NetIPv4Protocol -MediaSenseEventLog Disabled
Set-NetIPv4Protocol -MinimumMtu 1500
Set-NetIPv4Protocol -MulticastForwarding Enabled
Set-NetIPv4Protocol -NeighborCacheLimitEntries 256
Set-NetIPv4Protocol -RandomizeIdentifiers Enabled
Set-NetIPv4Protocol -ReassemblyLimitBytes 65535
Set-NetIPv4Protocol -RouteCacheLimitEntries 256
Set-NetIPv4Protocol -SourceRoutingBehavior Drop

Set-NetIPv6Protocol -AddressMaskReply Disabled
Set-NetIPv6Protocol -DeadGatewayDetection Enabled
Set-NetIPv6Protocol -DefaultHopLimit 128
Set-NetIPv6Protocol -DhcpMediaSense Disabled
Set-NetIPv6Protocol -GroupForwardedFragments Disabled
Set-NetIPv6Protocol -IcmpRedirects Disabled
Set-NetIPv6Protocol -IGMPLevel All
Set-NetIPv6Protocol -IGMPVersion Version3
Set-NetIPv6Protocol -MediaSenseEventLog Disabled
Set-NetIPv6Protocol -MinimumMtu 1500
Set-NetIPv6Protocol -MulticastForwarding Enabled
Set-NetIPv6Protocol -NeighborCacheLimitEntries 256
Set-NetIPv6Protocol -RandomizeIdentifiers Enabled
Set-NetIPv6Protocol -ReassemblyLimitBytes 65535
Set-NetIPv6Protocol -RouteCacheLimitEntries 256
Set-NetIPv6Protocol -SourceRoutingBehavior Drop

Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -AdvertiseDefaultRoute Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -AdvertisedRouterLifetime 450
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -Advertising Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -BaseReachableTimeMs 15
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -ClampMss Enabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -CurrentHopLimit 64
# Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -CurrentHopLimit 0
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -DadRetransmitTimeMs 1000
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -DadTransmits 5
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -Dhcp Enabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -DirectedMacWolPattern Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -EcnMarking AppDecide
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -ForceArpNdWolPattern Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -Forwarding Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -IgnoreDefaultRoutes Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -InterfaceMetric 0
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -ManagedAddressConfiguration Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -NeighborDiscoverySupported Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -NeighborUnreachabilityDetection Enabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -NlMtuBytes 1500
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -OtherStatefulConfiguration Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -PolicyStore ActiveStore
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -ReachableTime 5000
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -RetransmitTimeMs 500
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -RouterDiscovery Enabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -WeakHostReceive Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv4 -WeakHostSend Disabled

Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -AdvertiseDefaultRoute Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -AdvertisedRouterLifetime 450
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -Advertising Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -BaseReachableTimeMs 15
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -ClampMss Enabled
# Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -CurrentHopLimit 0
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -CurrentHopLimit 64
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -DadRetransmitTimeMs 1000
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -DadTransmits 5
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -Dhcp Enabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -DirectedMacWolPattern Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -EcnMarking AppDecide
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -ForceArpNdWolPattern Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -Forwarding Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -IgnoreDefaultRoutes Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -InterfaceMetric 0
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -ManagedAddressConfiguration Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -NeighborDiscoverySupported Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -NeighborUnreachabilityDetection Enabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -NlMtuBytes 1500
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -OtherStatefulConfiguration Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -PolicyStore ActiveStore
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -ReachableTime 5000
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -RetransmitTimeMs 500
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -RouterDiscovery Enabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -WeakHostReceive Disabled
Set-NetIPInterface -InterfaceAlias 'Wi-Fi' -AddressFamily IPv6 -WeakHostSend Disabled

Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -AdvertiseDefaultRoute Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -AdvertisedRouterLifetime 450
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -Advertising Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -BaseReachableTimeMs 15
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -ClampMss Enabled
# Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -CurrentHopLimit 0
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -CurrentHopLimit 64
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -DadRetransmitTimeMs 1000
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -DadTransmits 5
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -Dhcp Enabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -DirectedMacWolPattern Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -EcnMarking AppDecide
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -ForceArpNdWolPattern Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -Forwarding Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -IgnoreDefaultRoutes Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -InterfaceMetric 0
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -ManagedAddressConfiguration Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -NeighborDiscoverySupported Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -NeighborUnreachabilityDetection Enabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -NlMtuBytes 1500
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -OtherStatefulConfiguration Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -PolicyStore ActiveStore
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -ReachableTime 5000
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -RetransmitTimeMs 500
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -RouterDiscovery Enabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -WeakHostReceive Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv4 -WeakHostSend Disabled

Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -AdvertiseDefaultRoute Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -AdvertisedRouterLifetime 450
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -Advertising Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -BaseReachableTimeMs 15
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -ClampMss Enabled
# Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -CurrentHopLimit 0
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -CurrentHopLimit 64
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -DadRetransmitTimeMs 1000
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -DadTransmits 5
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -Dhcp Enabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -DirectedMacWolPattern Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -EcnMarking AppDecide
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -ForceArpNdWolPattern Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -Forwarding Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -IgnoreDefaultRoutes Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -InterfaceMetric 0
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -ManagedAddressConfiguration Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -NeighborDiscoverySupported Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -NeighborUnreachabilityDetection Enabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -NlMtuBytes 1500
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -OtherStatefulConfiguration Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -PolicyStore ActiveStore
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -ReachableTime 5000
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -RetransmitTimeMs 500
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -RouterDiscovery Enabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -WeakHostReceive Disabled
Set-NetIPInterface -InterfaceAlias 'Ethernet' -AddressFamily IPv6 -WeakHostSend Disabled

Clear-DnsClientCache
Start-Process -FilePath "ipconfig.exe" -ArgumentList "/flushdns" -NoNewWindow -Wait
Start-Process -FilePath "ipconfig.exe" -ArgumentList "/renew" -NoNewWindow -Wait

exit
