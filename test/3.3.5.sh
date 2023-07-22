#!/bin/sh
# ** AUTO GENERATED **

# 3.3.5 - Ensure suspicious packets are logged (Automated) - Server1 Workstation1

sysctl net.ipv4.icmp_echo_ignore_broadcasts | grep -E "net.ipv4.icmp_echo_ignore_broadcasts = 1"
if [[ $? == 0 ]]; then
    exit 0
fi
if [[ $(ls -A /etc/sysctl.d/) ]] ; then
    grep "net.ipv4.icmp_echo_ignore_broadcasts" /etc/sysctl.conf /etc/sysctl.d/* | grep -E "net.ipv4.icmp_echo_ignore_broadcasts = 1" || exit $?
else
    grep "net.ipv4.icmp_echo_ignore_broadcasts" /etc/sysctl.conf | grep -E "net.ipv4.icmp_echo_ignore_broadcasts = 1" || exit $?
fi