#!/bin/sh
# ** AUTO GENERATED **

# 1.1.20 - Ensure nodev option set on removable media partitions (Automated) - Server1 Workstation1

MEDIA=$(mount -l -t vfat,iso9660,ext)

if [[ -z $MEDIA ]]; then
        exit 0
else
        echo $MEDIA | grep "nodev" || exit $?
fi
