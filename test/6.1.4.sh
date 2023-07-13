#!/bin/sh
# ** AUTO GENERATED **

# 6.1.4 - Ensure permissions on /etc/shadow are configured (Automated) - Server1 Workstation1

stat -L -c "%a %u %g" /etc/shadow | grep -q "0000 0 0$" || exit $?
