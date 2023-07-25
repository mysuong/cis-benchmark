#!/bin/sh
# ** AUTO GENERATED **

# 5.3.10 - Ensure SSH root login is disabled (Automated) - Server1 Workstation1

grep "^\s*PermitRootLogin" /etc/ssh/sshd_config | grep -q "PermitRootLogin\s*no" || exit $?