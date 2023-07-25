#!/bin/sh
# ** AUTO GENERATED **

# 4.1.1.2 - Ensure auditd service is enabled and running (Automated) - Server2 Workstation2

systemctl is-enabled auditd | grep "enabled" || exit $?
