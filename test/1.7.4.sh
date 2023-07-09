#!/bin/sh
# ** AUTO GENERATED **

# 1.7.1.4 - Ensure permissions on /etc/motd are configured (Automated) - Server1 Workstation1

stat -L -c "%a %u %g" /etc/motd | grep -q "644 0 0$" || exit $?
