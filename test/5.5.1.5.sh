#!/bin/sh
# ** AUTO GENERATED **

# 5.5.1.5 - Ensure all users last password change date is in the past (Automated) - Server1 Workstation1

for usr in $(cut -d: -f1 /etc/shadow); do
[[ $(chage --list $usr | grep '^Last password change' | cut -d: -f2) > $(date) ]] && echo "$usr :$(chage --list $usr | grep '^Last password change' | cut -d: -f2)"; done