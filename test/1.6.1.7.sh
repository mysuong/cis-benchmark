#!/bin/sh
# ** AUTO GENERATED **

# 1.6.1.7 - Ensure SETroubleshoot is not installed (Automated) - Server1 Workstation1

rpm -q setroubleshoot | grep -E "package setroubleshoot is not installed" || exit $1
