#!/bin/sh
# ** AUTO GENERATED **

# 1.1.1.1 - Ensure mounting of cramfs filesystems is disabled (Automated)

echo "install cramfs /bin/true" >> /etc/modprobe.d/cramfs.conf
rmmod cramfs
