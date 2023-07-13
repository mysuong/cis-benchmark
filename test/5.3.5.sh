#!/bin/sh
# ** AUTO GENERATED **

# 5.3.5 - Ensure SSH LogLevel is appropriate (Automated) - Server1 Workstation1

grep "^\s*LogLevel" /etc/ssh/sshd_config | grep -q "LogLevel\s*INFO" || exit $?
