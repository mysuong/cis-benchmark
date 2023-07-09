#!/bin/sh
# ** AUTO GENERATED **

# 1.9 - Ensure updates, patches, and additional security software are installed (Manual) - Server1 Workstation1

yum check-update --security 2>&1 | grep "No packages needed for security" || exit $?