#!/bin/sh
# ** AUTO GENERATED **

# 1.1.15 - Ensure separate partition exists for /var/log (Automated)

findmnt /var/log || exit $?
