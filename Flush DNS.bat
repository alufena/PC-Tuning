ipconfig /flushdns
ipconfig /registerdns
nbtstat -rr
::netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset
::netsh int tcp reset
netsh winsock reset
::netsh advfirewall reset
netsh branchcache reset
netsh http flush logbuffer
netsh winhttp reset proxy
exit
