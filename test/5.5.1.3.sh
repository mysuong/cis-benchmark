#!/bin/sh
# ** AUTO GENERATED **

# 5.5.1.3 - Ensure password expiration warning days is 7 or more (Automated) - Server1 Workstation1

warnage=$(grep ^\s*PASS_WARN_AGE /etc/login.defs | awk '{ print$2 ')
if [[ ${warnage} < 7 ]]; then exit 1; fi

for days in $(grep -E '^[^:]+:[^!*]' /etc/shadow | cut -d: -f6); do
    if [[ ${days} < 7 ]]; then exit 1; fi
done