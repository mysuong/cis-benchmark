#!/bin/sh
# ** AUTO GENERATED **

# 4.2.1.1 - Ensure rsyslog is installed (Automated) - Server1 Workstation1

systemctl is-enabled rsyslog | grep enabled || exit $?
