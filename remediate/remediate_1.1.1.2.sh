#!/bin/sh
# ** AUTO GENERATED **

# 1.1.1.2 - Ensure mounting of squashfs filesystems is disabled (Automated)

echo "install squashfs /bin/true" >> /etc/modprobe.d/squashfs.conf
rmmod squashfs
