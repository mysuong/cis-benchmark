#!/bin/sh
# ** AUTO GENERATED **

# 6.2.17 - Ensure no users have .rhosts files (Automated) - Server1 Workstation1

awk -F: '($1!~/(root|halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do
   if [ -d "$dir" ]; then
   file="$dir/.rhosts"
   if [ ! -h "$file" ] && [ -f "$file" ]; then
   echo "User: \"$user\" file: \"$file\" exists"
   exit 1
   fi
   fi
done
