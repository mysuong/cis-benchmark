#!/bin/sh
# ** AUTO GENERATED **

# 3.4.2 - Ensure SCTP is disabled (Automated) -  Server2 Workstation2

modprobe -n -v sctp | grep -E "(install /bin/true|FATAL: Module dccp not found.)" && exit 0
[[ -z `lsmod | grep sctp` ]] || exit $?
