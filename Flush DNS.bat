ipconfig /flushdns
ipconfig /registerdns
nbtstat -rr
netsh winsock reset catalog
netsh int ipv4 reset reset.log
netsh int ipv6 reset reset.log
netsh int ip reset all
netsh winsock reset
exit
