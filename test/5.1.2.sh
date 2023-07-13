#!/bin/sh
# ** AUTO GENERATED **

# 5.1.2 - Ensure permissions on /etc/crontab are configured (Automated) - Server1 Workstation1

stat -L -c "%a %u %g" /etc/crontab | grep -q "600 0 0$" || exit $?
