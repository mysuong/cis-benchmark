#!/bin/sh
# ** AUTO GENERATED **

# 6.1.5 - Ensure permissions on /etc/shadow- are configured (Automated) - Server1 Workstation1

stat -L -c "%a %u %g" /etc/shadow- | grep -q "^0 0 0$" || exit $?
