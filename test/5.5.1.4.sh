#!/bin/sh
# ** AUTO GENERATED **

# 5.5.1.4 - Ensure inactive password lock is 30 days or less (Automated) - Server1 Workstation1

lockday=$(useradd -D | grep INACTIVE | cut -d= -f2)
if [[ ${lockday} < 30 || ${lockday} -eq -1 ]]; then exit 1; fi

for days in $(grep -E '^[^:]+:[^!*]' /etc/shadow | cut -d: -f7); do
    if [[ ${days} < 30 || ${maxday} -eq -1 ]]; then exit 1; fi
done