#!/bin/sh
# ** AUTO GENERATED **

# 5.5.1.2 - Ensure minimum days between password changes is configured (Automated) - Server1 Workstation1

minday=$(grep ^\s*PASS_MIN_DAYS /etc/login.defs | awk '{ print$2 ')
if [[ ${minday} < 1 ]]; then exit 1; fi
for days in $(grep -E '^[^:]+:[^!*]' /etc/shadow | cut -d: -f4); do
    if [[ ${days} < 1 ]]; then exit 1; fi
done