#!/bin/sh
# ** AUTO GENERATED **

# 2.2.3 - Ensure Avahi Server is not installed (Automated) - Server1 Workstation2

rpm -q avahi-autoipd avahi 2>&1 | grep -E "package avahi-autoipd is not installed|package avahi is not installed" || exit $?

