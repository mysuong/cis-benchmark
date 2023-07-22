#!/bin/sh
# ** AUTO GENERATED **

# 5.1.9 - Ensure at is restricted to authorized users (Automated) - Server1 Workstation1

if [[  -f /etc/at.deny ]]; then
        echo /etc/at.deny must not exist
        exit 1
fi
stat -L -c "%a %u %g" /etc/at.allow | grep -q "600 0 0$" || exit $?
