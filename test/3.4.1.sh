#!/bin/sh
# ** AUTO GENERATED **

# 3.4.1 - Ensure DCCP is disabled (Automated) - Server2 Workstation2

modprobe -n -v dccp | grep -E "(install /bin/true|FATAL: Module dccp not found.)" && exit 0
[[ -z `lsmod | grep dccp` ]] || exit $?
