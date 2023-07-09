#!/bin/sh
# ** AUTO GENERATED **

# 1.1.20 - Ensure nodev option set on removable media partitions (Automated) - Server1 Workstation1

for rmpo in $(lsblk -o RM,MOUNTPOINT | awk -F " " '/1/ {if ($2 != "") print $2}'); do
 	findmnt "$rmpo" | grep nodev || exit $?
done
