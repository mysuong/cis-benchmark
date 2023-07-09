#!/bin/sh
# ** AUTO GENERATED **

# 2.2.11 - Ensure Samba is not installed (Automated) - Server1 Workstation1

systemctl is-enabled samba 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?
