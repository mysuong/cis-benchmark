#!/bin/sh
# ** AUTO GENERATED **

# 4.1.11 - Ensure use of privileged commands is collected (Automated) - Server2 Workstation2

priv_cmds="$(find / -xdev \( -perm -4000 -o -perm -2000 \) -type f)"
for cmd in ${priv_cmds} ; do
cut -d\# -f1 /etc/audit/audit.rules | egrep "\-k[[:space:]]+privileged" | egrep "\-F[[:space:]]+path=${cmd}" \| egrep "\-F[[:space:]]+perm=x" | egrep "\-F[[:space:]]+auid>=500" | egrep "\-F[[:space:]]+auid\!=4294967295" | egrep -q "\-a[[:space:]]+always,exit|\-a[[:space:]]+exit,always" || exit 1
done
