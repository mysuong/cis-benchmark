#!/bin/sh
# ** AUTO GENERATED **

# 4.1.1.2 - Ensure auditd service is enabled and running (Automated) - Server2 Workstation2

cut -d\# -f2 /etc/audit/auditd.conf | grep 'space_left_action' | cut -d= -f2 | tr -d '[[:space:]]' | grep -q 'email' || exit 1
cut -d\# -f2 /etc/audit/auditd.conf | grep 'action_mail_acct' | cut -d= -f2 | tr -d '[[:space:]]' | grep -q 'root' || exit 1
cut -d\# -f2 /etc/audit/auditd.conf | grep 'admin_space_left_action' | cut -d= -f2 | tr -d '[[:space:]]' | grep -q 'halt' || exit 1
