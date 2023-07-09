#!/bin/sh
# ** AUTO GENERATED **

# 1.6.1.4 - Ensure the SELinux mode is enforcing or permissive (Automated) - Server1 Workstation1

grep -Ei '^\s*SELINUX=(enforcing|permissive)' /etc/selinux/config
