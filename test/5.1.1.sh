#!/bin/sh
# ** AUTO GENERATED **

# 5.1.1 - Ensure cron daemon is enabled and running (Automated) - Server1 Workstation1

systemctl is-enabled crond | grep enabled || exit $?