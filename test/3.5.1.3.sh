#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.3 - Ensure nftables either not installed or masked with firewalld (Automated) - Server1 Workstation1

systemctl is-enabled nftables 2>&1 | grep -E "(masked|disabled|No such file or directory)" || exit $?
