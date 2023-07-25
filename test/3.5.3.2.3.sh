#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.2.3 - Ensure iptables rules exist for all open ports (Automated) - Server1 Workstation1

for port in $(netstat -lnt |grep ^tcp | grep LISTEN | awk {'print $4'} | cut -d":" -f2); do
	echo open tcp port $port
	iptables -L INPUT -v -n | grep "ACCEPT\s*tcp.*:$port" || exit $?
done
# udp
for port in $(netstat -lnt |grep ^udp | grep LISTEN | awk {'print $4'} | cut -d":" -f2); do
	echo open udp port $port
	iptables -L INPUT -v -n | grep "ACCEPT\s*udp.*:$port" || exit $?
done
exit 0