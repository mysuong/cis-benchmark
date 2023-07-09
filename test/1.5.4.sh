#!/bin/sh
# ** AUTO GENERATED **

# 1.5.4 - Ensure prelink is not installed (Automated) - Server1 Workstation1

rpm -q prelink | grep -E "package prelink is not installed" || exit $?
