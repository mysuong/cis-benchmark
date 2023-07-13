#!/bin/sh
# ** AUTO GENERATED **

# 4.2.2.1 - Ensure journald is configured to send logs to rsyslog (Automated) - Server1 Workstation1

systemctl is-enabled rsyslog | grep enabled || exit $?
