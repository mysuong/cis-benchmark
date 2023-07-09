#!/bin/sh
# ** AUTO GENERATED **

# 1.6.1.1 - Ensure SELinux is installed (Automated) - Server1 Workstation1

rpm -q libselinux |grep -E "libselinux-" || exit $?
