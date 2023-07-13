#!/bin/sh
# ** AUTO GENERATED **

# 4.1.1.3 - Ensure auditing for processes that start prior to auditd is enabled (Automated) - Server2 Workstation2

cut -d\# -f2 /etc/audit/auditd.conf | grep 'max_log_file_action' | cut -d= -f2 | tr -d '[[:space:]]' | grep -q 'keep_logs' || exit 1
