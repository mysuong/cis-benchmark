#!/bin/sh
# ** AUTO GENERATED **

# 5.3.4 - Ensure SSH access is limited (Automated) - Server1 Workstation1

grep -qE "^AllowUsers|^AllowGroups|^DenyUsers|^DenyGroups" /etc/ssh/sshd_config || exit $?
