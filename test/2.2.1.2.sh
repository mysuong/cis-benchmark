#!/bin/sh
# ** AUTO GENERATED **

# 2.2.1.2 - Ensure chrony is configured (Automated) - Server1 Workstation1

grep -E "^(server|pool)" /etc/chrony.conf || exit $?
