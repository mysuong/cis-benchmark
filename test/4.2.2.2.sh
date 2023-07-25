#!/bin/sh
# ** AUTO GENERATED **

# 4.2.2.2 - Ensure journald is configured to compress large log files (Automated) - Server1 Workstation1

compress_setting=$(grep -E '^\s*Compress' /etc/systemd/journald.conf | awk '{print $2}')
[[ -z "${compress_setting}" ]] || exit 1