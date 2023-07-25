#!/bin/sh
# ** AUTO GENERATED **

# 1.1.11 - Ensure separate partition exists for /var/tmp (Automated) - Server2 Workstation2

# findmnt /var/tmp || exit $?
mount | grep /var/tmp || exit $?

