#!/bin/sh
# ** AUTO GENERATED **

# 2.2.1.3 - Ensure ntp is configured (Automated) - Server1 Workstation1

rpm -q ntp | grep -E "^ntp-"
if [[ $? -eq 0 ]]; then

  grep "^restrict -6 default kod nomodify notrap nopeer noquery" /etc/ntp.conf || exit $1

  grep -E "^(server|pool)" /etc/ntp.conf || exit $1
fi

