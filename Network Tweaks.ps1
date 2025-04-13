Set-NetAdapterRdma -Name "*" -Enabled $True
Set-NetAdapterRsc -Name "*"-IPv4Enabled $True -IPv6Enabled $True
Set-NetAdapterRss -Name "*" -Profile Conservative
Set-NetAdapterIPsecOffload -Name "*" -Enabled $True
Set-NetAdapterChecksumOffload -Name "*" -TcpIPv6Enabled RxTxEnabled
Set-NetAdapterChecksumOffload -Name "*" -IpIPv4Enabled RxTxEnabled -TcpIpv4Enabled RxTxEnabled -UdpIpv4Enabled RxTxEnabled
Enable-NetAdapterChecksumOffload -Name "*"
Enable-NetAdapterIPsecOffload -Name "*"
Enable-NetAdapterRsc -Name "*"
Enable-NetAdapterRss -Name "*"
Enable-NetAdapterQos -Name "*"
Disable-NetAdapterLso -Name "*" 
Enable-NetAdapterEncapsulatedPacketTaskOffload -Name "*"
Enable-NetAdapterSriov -Name "*"
Enable-NetAdapterVmq -Name "*"
netsh int tcp set global ecncapability=enabled
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=enabled
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh int tcp set global fastopen=enabled
netsh int tcp set global fastopenfallback=enabled
netsh int tcp set global prr=enabled
netsh int tcp set global pacingprofile=always
netsh int tcp set global hystart=enabled
netsh int tcp set supplemental internet enablecwndrestart=enabled
netsh int tcp set security mpp=enabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set supplemental internet congestionprovider=dctcp
#netsh int tcp set global autotuninglevel=disable
#netsh int tcp set global nonsackrttresiliency=disabled
#netsh int tcp set global ecncapability=disabled
#netsh int tcp set global timestamps=disabled
#netsh int tcp set supplemental custom tcpackfrequency=1
