#!/bin/sh
# ** AUTO GENERATED **

# 3.2.1 - Ensure IP forwarding is disabled (Automated) - Server1 Workstation1

sysctl net.ipv4.ip_forward | grep "net.ipv4.ip_forward = 0" || exit $?
# Current configuration
checkipv4="$(grep -E -s "^\s*net\.ipv4\.ip_forward\s*=\s*[^0]+$" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib
/sysctl.d/*.conf /run/sysctl.d/*.conf)"
[[ -n "${checkipv4}" ]] && exit 1
# IPv6 Checking
if [[ "$ipv6_status" != disabled ]]; then
# Current status
sysctl net.ipv6.conf.all.forwarding | grep "net.ipv6.conf.all.forwarding = 0" || exit $?
# Current configuration
checkipv6="$(grep -E -s "^\s*net\.ipv6\.conf\.all\.forwarding\s*=\s*[^0]+$" /etc/sysctl.conf /etc/sysctl.d/*.conf 
/usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)"
[[ -n "${checkipv6}" ]] && exit 1
fi
exit 0


