#!/bin/sh
# ** AUTO GENERATED **

# 6.2.3 - Ensure all groups in /etc/passwd exist in /etc/group (Automated) - Server1 Workstation1

for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do
   grep -q -P "^.*?:[^:]*:$i:" /etc/group
   if [ $? -ne 0 ]; then exit 1; fi
done