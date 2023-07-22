#!/bin/sh
# ** AUTO GENERATED **

# 5.3.3 - Ensure permissions on SSH public host key files are configured (Automated) - Server1 Workstation1

find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec stat {} \; || exit $?
