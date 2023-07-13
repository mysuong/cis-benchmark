#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.11 - Ensure nftables rules are permanent (Automated) - Server1 Workstation1

out=$(awk '/hook input/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print $2 }' /etc/sysconfig/nftables.conf)) || exit $?
out=$(awk '/hook forward/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print $2 }' /etc/sysconfig/nftables.conf)) || exit $?

