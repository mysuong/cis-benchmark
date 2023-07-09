#!/bin/sh
# ** AUTO GENERATED **

# 2.2.5 - Ensure DHCP Server is not installed (Automated) - Server1 Workstation1

systemctl is-enabled dhcpd 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?
