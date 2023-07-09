#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.7 - Ensure nftables loopback traffic is configured (Automated) - Server1 Workstation1

nft list ruleset | awk '/hook input/,/}/' | grep 'ip saddr' | grep -E "(ip saddr 127.0.0.0/8 counter packets 0 bytes 0 drop)" || exit $?