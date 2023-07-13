#!/bin/sh
# ** AUTO GENERATED **

# 6.2.10 - Ensure root PATH Integrity (Automated) - Server1 Workstation1

RPCV="$(sudo -Hiu root env | grep '^PATH' | cut -d= -f2)"
echo "$RPCV" | grep -q "::" && echo "root's path contains a empty directory (::)"
echo "$RPCV" | grep -q ":$" && echo "root's path contains a trailing (:)"

for x in $(echo "$RPCV" | tr ":" " "); do
   if [ -d "$x" ]; then
   ls -ldH "$x" | awk '$9 == "." {print "PATH contains current working directory (.); exit 1"}
   $3 != "root" {print $9, "is not owned by root"; exit 1}
   substr($1,6,1) != "-" {print $9, "is group writable"; exit 1}
   substr($1,9,1) != "-" {print $9, "is world writable"; exit 1}'
[[ $? == 0 ]] || exit $?
   else
   echo "$x is not a directory"
   exit 1
   fi
done