#!/bin/sh
# ** AUTO GENERATED **

# 1.1.22 - Ensure sticky bit is set on all world-writable directories (Automated) - Server1 Workstation1

for dir in `df --local -P | awk {'if (NR!=1) print $6'}`; do
	nc=$(find $dir -xdev -type d \( -perm -0002 -a ! -perm -1000 \) -print -quit)
	echo $dir:$nc
	[[ -z $nc ]] || exit 1
done
exit 0
