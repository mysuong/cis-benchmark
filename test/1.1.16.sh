#!/bin/sh
# ** AUTO GENERATED **

# 1.1.16 - Ensure separate partition exists for /var/log/audit (Automated) - Server2 Workstation2

findmnt /var/log/audit || exit $?
