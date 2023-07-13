#!/bin/sh
# ** AUTO GENERATED **

# 5.5.1.1 - Ensure password expiration is 365 days or less (Automated) - Server1 Workstation1

maxday=$(grep ^\s*PASS_MAX_DAYS /etc/login.defs | awk '{ print$2 ')
if [[ ${maxday} > 365 ]]; then exit 1; fi

for days in $(grep -E '^[^:]+:[^!*]' /etc/shadow | cut -d: -f5); do
    if [[ ${days} > 365 ]]; then exit 1; fi
done
