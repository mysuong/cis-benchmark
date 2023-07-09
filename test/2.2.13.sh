#!/bin/sh
# ** AUTO GENERATED **

# 2.2.13 - Ensure net-snmp is not installed (Automated) - Server1 Workstation1

systemctl is-enabled net-snmp 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?
