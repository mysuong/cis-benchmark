#!/bin/sh
# ** AUTO GENERATED **

# 6.1.8 - Ensure permissions on /etc/group are configured (Automated) - Server1 Workstation1

stat -L -c "%a %u %g" /etc/group | grep -q "[0246][04][04] 0 0$" || exit $?
