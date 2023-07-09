#!/bin/sh
# ** AUTO GENERATED **

# 1.6.1.8 - Ensure SETroubleshoot is not installed (Automated) - Server1 Workstation1

rpm -q mcstrans | grep -E "package mcstrans is not installed" || exit $1