#!/bin/sh
# ** AUTO GENERATED **

# 2.2.5 - Ensure DHCP Server is not installed (Automated) - Server1 Workstation1

rpm -q dhcp | grep -E "(package dhcp is not installed)" || exit $?
