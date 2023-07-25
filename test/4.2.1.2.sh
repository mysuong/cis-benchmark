#!/bin/sh
# ** AUTO GENERATED **

# 4.2.1.2 - Ensure rsyslog Service is enabled and running (Automated) - Server1 Workstation1

systemctl is-enabled rsyslog | grep enabled || exit $?
