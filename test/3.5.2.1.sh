#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.1 - Ensure nftables is installed (Automated) - Server1 Workstation1

rpm -q nftables | grep -E "(nftables)" || exit $?