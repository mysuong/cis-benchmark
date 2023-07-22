#!/bin/sh
# ** AUTO GENERATED **

# 3.3.1 - Ensure source routed packets are not accepted (Automated) -  Server1 Workstation1

# IPv4
sysctl net.ipv4.conf.all.accept_source_route | grep "net.ipv4.conf.all.accept_source_route = 0" || exit $?
sysctl net.ipv4.conf.default.accept_source_route | grep "net.ipv4.conf.default.accept_source_route = 0" || exit $?
checkipv4_1="$(grep -E -s "^\s*net\.ipv4\.conf\.all\.accept_source_route\s*=\s*0$" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)"
checkipv4_2="$(grep -E -s "^\s*net\.ipv4\.conf\.default\.accept_source_route\s*=\s*0$" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)"
[[ -z "${checkipv4_1}" ]] && exit 1
[[ -z "${checkipv4_2}" ]] && exit 1
# IPv6
if [[ "$ipv6_status" != disabled ]]; then
    sysctl net.ipv6.conf.all.accept_source_route | grep "net.ipv6.conf.all.accept_source_route = 0" || exit $?
    sysctl net.ipv6.conf.default.accept_source_route | grep "net.ipv6.conf.default.accept_source_route = 0" || exit $?
    checkipv6_1="$(grep -E -s "^\s*net\.ipv6\.conf\.all\.accept_source_route\s*=\s*0$" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)"
    checkipv6_2="$(grep -E -s "^\s*net\.ipv6\.conf\.default\.accept_source_route\s*=\s*0$" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf)"
    [[ -z "${checkipv6_1}" ]] && exit 1
    [[ -z "${checkipv6_2}" ]] && exit 1
fi
exit 0


