#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.2.6 - Ensure iptables is enabled and running (Automated) - Server1 Workstation1

systemctl is-enabled iptables | grep "enabled" || exit 1