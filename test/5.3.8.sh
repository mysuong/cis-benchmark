#!/bin/sh
# ** AUTO GENERATED **

# 5.3.8 - Ensure SSH IgnoreRhosts is enabled (Automated) - Server1 Workstation1

grep "^\s*IgnoreRhosts" /etc/ssh/sshd_config | grep -q "IgnoreRhosts\s*yes" || exit $?