#!/bin/sh
# ** AUTO GENERATED **

# 2.1.1 - Ensure xinetd is not installed (Automated) - Server1 Workstation1

rpm -q xinetd | grep -E "package xinetd is not installed" || exit $?

