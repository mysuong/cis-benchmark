#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.4 - Ensure firewalld service enabled and running (Automated) - Server1 Workstation1

systemctl is-enabled firewalld | grep "enabled" || exit $?
firewall-cmd --state | grep "running" || exit $?
