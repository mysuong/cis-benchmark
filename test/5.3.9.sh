#!/bin/sh
# ** AUTO GENERATED **

# 5.3.9 - Ensure SSH HostbasedAuthentication is disabled (Automated) - Server1 Workstation1

grep "^\s*HostbasedAuthentication" /etc/ssh/sshd_config | grep -q "HostbasedAuthentication\s*no" || exit $?
