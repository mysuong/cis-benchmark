#!/bin/sh
# ** AUTO GENERATED **

# 2.3.2 - Ensure rsh client is not installed (Automated) - Server1 Workstation1

rpm -q rsh | grep -E "package rsh is not installed" || exit $1
