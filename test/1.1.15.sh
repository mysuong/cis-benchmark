#!/bin/sh
# ** AUTO GENERATED **

# 1.1.15 - Ensure separate partition exists for /var/log (Automated) - Server2 Workstation2

findmnt /var/log || exit $?
