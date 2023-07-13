#!/bin/sh
# ** AUTO GENERATED **

# 5.1.4 - Ensure permissions on /etc/cron.daily are configured (Automated) - Server1 Workstation1

stat -L -c "%a %u %g" /etc/cron.daily | grep -q "700 0 0$" || exit $?
