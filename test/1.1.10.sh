#!/bin/sh
# ** AUTO GENERATED **

# 1.1.10 - Ensure separate partition exists for /var (Automated) - Server2 Workstation2

mount | grep /var || exit $?
