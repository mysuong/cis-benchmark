#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.10 - Ensure nftables service is enabled (Automated) - Server1 Workstation1

systemctl is-enabled nftables | grep "enabled" || exit $?