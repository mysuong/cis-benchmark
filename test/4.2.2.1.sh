#!/bin/sh
# ** AUTO GENERATED **

# 4.2.2.1 - Ensure journald is configured to send logs to rsyslog (Automated) - Server1 Workstation1

check=$(grep -E ^\s*ForwardToSyslog /etc/systemd/journald.conf)
[[ -z "${check}" ]]|| exit $?
