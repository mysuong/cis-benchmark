#!/bin/sh
# ** AUTO GENERATED **

# 1.1.19 - Ensure removable media partitions include noexec option (Automated) - Server1 Workstation1

for rmpo in $(lsblk -o RM,MOUNTPOINT | awk -F " " '/1/ {if ($2 != "") print $2}'); do
	findmnt "$rmpo" | grep noexec || exit $?
done
