#!/bin/sh
# ** AUTO GENERATED **

# 1.6.1.3 - Ensure SELinux policy is configured (Automated) - Server1 Workstation1

grep SELINUXTYPE=targeted /etc/selinux/config || exit $?
