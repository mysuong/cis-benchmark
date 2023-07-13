#!/bin/sh
# ** AUTO GENERATED **

# 6.2.8 - Ensure no duplicate GIDs exist (Automated) - Server1 Workstation1

cut -d: -f3 /etc/group | sort | uniq -d | while read -r x; do
   echo "Duplicate GID ($x) in /etc/group"
   exit 1
done
