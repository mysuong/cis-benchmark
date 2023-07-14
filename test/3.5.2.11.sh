#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.11 - Ensure nftables rules are permanent (Automated) - Server1 Workstation1

out1=$(awk '/hook input/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print $2 }' /etc/sysconfig/nftables.conf)) || echo $?
out2=$(awk '/hook forward/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print $2 }' /etc/sysconfig/nftables.conf)) || echo $?
out3=$(awk '/hook output/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print $2 }' /etc/sysconfig/nftables.conf)) || echo $?

