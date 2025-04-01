ipconfig /flushdns
netsh winsock reset catalog
netsh int ipv4 reset reset.log
netsh int ipv6 reset reset.log
netsh winsock reset
netsh int ip reset
::netsh int tcp set global autotuninglevel=disable
::netsh int tcp set global nonsackrttresiliency=disabled
::netsh int tcp set global ecncapability=disabled
::netsh int tcp set global timestamps=disabled
::netsh int tcp set supplemental custom tcpackfrequency=1
exit