#!/bin/sh
# ** AUTO GENERATED **

# 6.1.7 - Ensure permissions on /etc/gshadow are configured (Automated) - Server1 Workstation1

stat -L -c "%a %u %g" /etc/gshadow | grep -q "^0 0 0$" || exit $?
