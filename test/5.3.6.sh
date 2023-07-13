#!/bin/sh
# ** AUTO GENERATED **

# 5.3.6 - Ensure SSH X11 forwarding is disabled (Automated) - Server1 Workstation1

grep "^\s*X11Forwarding" /etc/ssh/sshd_config | grep -q "X11Forwarding\s*no" || exit $?
