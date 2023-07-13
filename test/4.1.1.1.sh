#!/bin/sh
# ** AUTO GENERATED **

# 4.1.1.1 - Ensure auditd is installed (Automated) - Server2 Workstation2

cut -d\# -f1 /etc/audit/auditd.conf | egrep -q "max_log_file[[:space:]]|max_log_file=" || exit 1
