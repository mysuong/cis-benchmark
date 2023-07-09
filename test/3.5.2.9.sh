#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.9 - Ensure nftables default deny firewall policy (Automated) - Server1 Workstation1

nft list ruleset | grep 'hook input' | grep -E "(type filter hook input priority 0; policy drop;)" || exit $?
nft list ruleset | grep 'hook forward' | grep -E "(type filter hook forward priority 0; policy drop;)" || exit $?
nft list ruleset | grep 'hook output' | grep -E "(type filter hook output priority 0; policy drop;)" || exit $?
