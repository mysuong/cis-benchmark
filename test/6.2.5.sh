#!/bin/sh
# ** AUTO GENERATED **

# 6.2.5 - Ensure no duplicate user names exist (Automated) - Server1 Workstation1

cut -d: -f1 /etc/passwd | sort | uniq -d | while read x; do
   echo "Duplicate login name ${x} in /etc/passwd"
   exit 1
done
