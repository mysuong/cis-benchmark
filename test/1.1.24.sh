#!/bin/sh
# ** AUTO GENERATED **

# 1.1.24 - Disable USB Storage (Automated) - Server1 Workstation2

modprobe -n -v usb-storage 2>&1 | grep -E "(install /bin/true|FATAL: Module usb-storage not found.)" || echo $?
[[ -z "$(lsmod | grep usb-storage)" ]] || exit 1