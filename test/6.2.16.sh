#!/bin/sh
# ** AUTO GENERATED **

# 6.2.16 - Ensure no users have .netrc files (Automated) - Server1 Workstation1

awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do
   if [ -d "$dir" ]; then
   file="$dir/.netrc"
   if [ ! -h "$file" ] && [ -f "$file" ]; then
   if stat -L -c "%A" "$file" | cut -c4-10 | grep -Eq '[^-]+'; then
   echo "FAILED: User: \"$user\" file: \"$file\" exists with permissions: \"$(stat -L -c "%a" "$file")\", remove file or excessive permissions"
   exit 1
   else
   echo "WARNING: User: \"$user\" file: \"$file\" exists with permissions: \"$(stat -L -c "%a" "$file")\", remove file unless required"
   exit 2
   fi
   fi
   fi
done
