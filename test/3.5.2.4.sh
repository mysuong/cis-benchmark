#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.4 - Ensure iptables are flushed with nftables (Manual) - Server1 Workstation1

# For iptables:
iptables -L | grep -E "(No rules should be returned)" | exit $?
# For iptables:
ip6tables -L | grep -E "(No rules should be returned)" | exit $?