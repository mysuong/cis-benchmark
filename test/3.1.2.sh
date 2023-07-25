#!/bin/sh
# ** AUTO GENERATED **

# 3.1.2 - Ensure wireless interfaces are disabled (Automated) - Server1 Workstation2

for i in $(iwconfig 2>&1 | egrep -v "no[[:space:]]*wireless" | cut -d' ' -f1); do
    ip link show up | grep "${i}:"
    if [[ "$?" -eq 0 ]]; then
        return 1
    fi
done


