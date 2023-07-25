#!/bin/sh
# ** AUTO GENERATED **

# 6.2.11 - Ensure all users' home directories exist (Automated) - Server1 Workstation1

awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do
   if [ ! -d "$dir" ]; then
   echo "User: \"$user\" home directory: \"$dir\" does not exist."
   exit 1
   fi
done