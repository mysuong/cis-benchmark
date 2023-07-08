#!/bin/sh
# ** AUTO GENERATED **

# 1.1.1.2 - Ensure mounting of squashfs filesystems is disabled (Automated)

modprobe -n -v squashfs 2>&1 | grep -E "(install /bin/true|FATAL: Module squashfs not found.)" || exit $?
[[ -z "$(lsmod | grep squashfs)" ]] || exit 1
