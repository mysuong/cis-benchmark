#!/bin/sh
# ** AUTO GENERATED **

# 2.2.1.3 - Ensure ntp is configured (Automated) - Server1 Workstation1

cmd="$(systemctl is-enabled ntpd | grep 'enabled')"
if [[ -n "${cmd}" ]]; then
 grep -E "^(server|pool)" /etc/ntp.conf || exit $?
else
 exit 1
fi

