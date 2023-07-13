#!/bin/sh
# ** AUTO GENERATED **

# 5.3.2 - Ensure permissions on SSH private host key files are configured (Automated) - Server1 Workstation1

find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec stat {} \;
