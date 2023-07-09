#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.2.1 - Ensure iptables loopback traffic is configured (Automated) - Server1 Workstation1

accept="ACCEPT[[:space:]]+all[[:space:]]+--[[:space:]]+lo[[:space:]]+\*[[:space:]]+0\.0\.0\.0\/0[[:space:]]+0\.0\.0\.0\/0"
accept2="ACCEPT[[:space:]]+all[[:space:]]+--[[:space:]]+\*[[:space:]]+lo[[:space:]]+0\.0\.0\.0\/0[[:space:]]+0\.0\.0\.0\/0"
drop="DROP[[:space:]]+all[[:space:]]+--[[:space:]]+\*[[:space:]]+\*[[:space:]]+127\.0\.0\.0\/8[[:space:]]+0\.0\.0\.0\/0"
iptables -L INPUT -v -n | egrep -q ${accept} || exit 1
iptables -L INPUT -v -n | egrep -q ${drop} || exit 1
iptables -L OUTPUT -v -n | egrep -q ${accept2} || exit 1