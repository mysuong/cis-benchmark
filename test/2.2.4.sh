#!/bin/sh
# ** AUTO GENERATED **

# 2.2.4 - Ensure CUPS is not installed (Automated) - Server1 Workstation1

systemctl is-enabled cups 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?
