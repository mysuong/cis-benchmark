#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.8 - Ensure nftables outbound and established connections are configured (Manual) - Server1 Workstation1

nft list ruleset | awk '/hook input/,/}/' | grep -E 'ip protocol (tcp|udp|icmp) ct state' | grep -E "(ip protocol tcp ct state established accept|ip protocol udp ct state established accept|ip protocol icmp ct state established accept)" || exit $?