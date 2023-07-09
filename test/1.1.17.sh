#!/bin/sh
# ** AUTO GENERATED **

# 1.1.17 - Ensure separate partition exists for /home (Automated) - Server2 Workstation2

findmnt /home || exit $?
