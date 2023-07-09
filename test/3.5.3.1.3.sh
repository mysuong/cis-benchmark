#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.1.3 - Ensure firewalld is either not installed or masked with iptables (Automated) - Server1 Workstation1

systemctl is-enabled firewalld 2>&1 | grep -E "(masked|disabled|No such file or directory)" || exit $?