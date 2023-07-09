#!/bin/sh
# ** AUTO GENERATED **

# 3.3.3 - Ensure secure ICMP redirects are not accepted (Automated) - Server1 Workstation1

# IPv4
sysctl sysctl net.ipv4.conf.all.secure_redirects | grep "net.ipv4.conf.all.secure_redirects = 0" || exit $?
sysctl sysctl net.ipv4.conf.default.secure_redirects | grep "net.ipv4.conf.default.secure_redirects = 0" || exit 
$?
checkipv4_1="$(grep -E -s "^\s*net\.ipv4\.conf\.all\.secure_redirects\s*=\s*0$" /etc/sysctl.conf /etc/sysctl.d/*.
conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)"
checkipv4_2="$(grep -E -s "^\s*net\.ipv4\.conf\.default\.secure_redirects\s*=\s*0$" /etc/sysctl.conf /etc/sysctl.d
/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)"
[[ -z "${checkipv4_1}" ]] && exit 1
[[ -z "${checkipv4_2}" ]] && exit 1
exit 0

