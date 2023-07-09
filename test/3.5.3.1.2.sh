#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.1.2 - Ensure nftables is not installed with iptables (Automated) - Server1 Workstation1

systemctl is-enabled nftables 2>&1 | grep -E "(masked|disabled|No such file or directory)" || exit $?