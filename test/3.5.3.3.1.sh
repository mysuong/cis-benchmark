#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.3.1 - Ensure ip6tables loopback traffic is configured (Automated) - Server1 Workstation1

accept="ACCEPT[[:space:]]+all[[:space:]]+lo[[:space:]]+\*[[:space:]]+\:\:\/0
0\.0\/0"
accept2="ACCEPT[[:space:]]+all[[:space:]]+\*[[:space:]]+lo[[:space:]]+\:\:\/0
0\.0\.0\/0"
drop="DROP[[:space:]]+all[[:space:]]+\*[[:space:]]+\*[[:space:]]+\:\:1
0\.0\/0"
ip6tables -L INPUT -v -n | egrep -q ${accept} || exit 1
ip6tables -L INPUT -v -n | egrep -q ${drop} || exit 1
ip6tables -L OUTPUT -v -n  | egrep -q ${accept2} || exit 1

