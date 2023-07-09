#!/bin/sh
# ** AUTO GENERATED **

# 1.6.1.5 - Ensure the SELinux mode is enforcing (Automated) - Server2 Workstation2

grep SELINUX=enforcing /etc/selinux/config || exit $?
