#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.3 - Ensure iptables-services not installed with nftables (Automated) - Server1 Workstation1

rpm -q iptables-services | grep -E "(package iptables-services is not installed)" || exit $?