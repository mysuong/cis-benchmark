#!/bin/sh
# ** AUTO GENERATED **

# 2.2.7 -  Ensure DNS Server is not installed (Automated) - Server1 Workstation1

systemctl is-enabled bind 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?
