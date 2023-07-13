#!/bin/sh
# ** AUTO GENERATED **

# 5.3.1 - Ensure permissions on /etc/ssh/sshd_config are configured (Automated) - Server1 Workstation1

stat -L -c "%a %u %g" /etc/ssh/sshd_config | grep -q "600 0 0$" || exit $?
