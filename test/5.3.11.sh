#!/bin/sh
# ** AUTO GENERATED **

# 5.3.11 - Ensure SSH PermitEmptyPasswords is disabled (Automated) - Server1 Workstation1

grep "^\s*PermitEmptyPasswords" /etc/ssh/sshd_config | grep -q "PermitEmptyPasswords\s*no" || exit $?
