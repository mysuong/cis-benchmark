#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.7 - Ensure firewalld drops unnecessary services and ports (Manual) - Server1 Workstation1

systemctl is-enabled firewalld | grep "enabled" || exit $?
firewall-cmd --get-active-zones | awk '!/:/ {print $1}' | while read ZN; do firewall-cmd --list-all --zone=$ZN; done || exit $?