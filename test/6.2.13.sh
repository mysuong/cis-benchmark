#!/bin/sh
# ** AUTO GENERATED **

# 6.2.13 - Ensure users' home directories permissions are 750 or more restrictive (Automated) - Server1 Workstation1

awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do
   if [ ! -d "$dir" ]; then
   echo "User: \"$user\" home directory: \"$dir\" doesn't exist"
   exit 1
   else
   dirperm=$(stat -L -c "%A" "$dir")
   if [ "$(echo "$dirperm" | cut -c6)" != "-" ] || [ "$(echo "$dirperm" | cut -c8)" != "-" ] || [ "$(echo "$dirperm" | cut -c9)" != "-" ] || [ "$(echo "$dirperm" | cut -c10)" != "-" ]; then
   echo "User: \"$user\" home directory: \"$dir\" has permissions: \"$(stat -L -c "%a" "$dir")\""
   exit 1
   fi
   fi
done