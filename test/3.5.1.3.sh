#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.3 - Ensure nftables either not installed or masked with firewalld (Automated) - Server1 Workstation1

rpm -q nftables | grep -E "(package nftables is not installed)" || exit $?
systemctl is-enabled nftables | grep masked || exit $?
