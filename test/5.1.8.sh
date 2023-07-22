#!/bin/sh
# ** AUTO GENERATED **

# 5.1.8 - Ensure cron is restricted to authorized users (Automated) - Server1 Workstation1

if [[ -f /etc/cron.deny ]]; then
        echo /etc/cron.deny must not exist
        exit 1
fi
stat -L -c "%a %u %g" /etc/cron.allow | grep -q "600 0 0$" || exit $?
