#!/bin/sh
# ** AUTO GENERATED **

# 3.3.3 - Ensure suspicious packets are logged (Automated) - Server1 Workstation1

sysctl net.ipv4.conf.all.log_martians | grep "net.ipv4.conf.all.log_martians = 1"
sysctl net.ipv4.conf.default.log_martians | grep "net.ipv4.conf.default.log_martians = 1"
sysctl sysctl net.ipv4.conf.all.log_martians | grep "net.ipv4.conf.all.log_martians = 1" || exit $?
sysctl sysctl net.ipv4.conf.default.log_martians | grep "net.ipv4.conf.default.log_martians = 1" || exit $?
checkipv4_1="$(grep -E -s "^\s*net\.ipv4\.conf\.all\.log_martians\s*=\s*0$" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)"
checkipv4_2="$(grep -E -s "^\s*net\.ipv4\.conf\.default\.log_martians\s*=\s*0$" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)"
[[ -z "${checkipv4_1}" ]] && exit 1
[[ -z "${checkipv4_2}" ]] && exit 1
exit 0