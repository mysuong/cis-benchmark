#!/bin/sh
# ** AUTO GENERATED **

# 5.3.18 - Ensure SSH warning banner is configured (Automated) - Server1 Workstation1

grep -qE "^Banner\s+" /etc/ssh/sshd_config || exit $?