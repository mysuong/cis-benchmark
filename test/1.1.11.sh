#!/bin/sh
# ** AUTO GENERATED **

# 1.1.11 - Ensure separate partition exists for /var/tmp (Automated)

findmnt /var/tmp || exit $?

