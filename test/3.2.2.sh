#!/bin/sh
# ** AUTO GENERATED **

# 3.2.2 - Ensure packet redirect sending is disabled (Automated)- Server1 Workstation1

sysctl net.ipv4.conf.all.accept_redirects | grep "net.ipv4.conf.all.accept_redirects = 0" || exit $?
sysctl net.ipv4.conf.default.accept_redirects | grep "net.ipv4.conf.default.accept_redirects = 0" || exit $?
checkipv4_1="$(grep -E -s "^\s*net\.ipv4\.conf\.all\.send_redirects\s*=\s*0$" /etc/sysctl.conf /etc/sysctl.d/*.
conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)"
checkipv4_2="$(grep -E -s "^\s*net\.ipv4\.conf\.default\.send_redirects\s*=\s*0$" /etc/sysctl.conf /etc/sysctl.d
/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)"
[[ -z "${checkipv4_2}" ]] && exit 1
[[ -z "${checkipv4_1}" ]] && exit 1
exit 0


