#!/bin/sh
# ** AUTO GENERATED **

# 4.1.1.3 - Ensure auditing for processes that start prior to auditd is enabled (Automated) - Server2 Workstation2

grep_grub="$(grep "^[[:space:]]*linux" /boot/grub2/grub.cfg | grep -v 'audit=1')"
[[ -z "${grep_grub}" ]] || exit 1
