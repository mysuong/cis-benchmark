#!/bin/sh
# ** AUTO GENERATED **

# 6.1.2 - Ensure permissions on /etc/passwd are configured (Automated) - Server1 Workstation1

stat -L -c "%a %u %g" /etc/passwd | grep -q "[0246][04][04] 0 0$" || exit $?