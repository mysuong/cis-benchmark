#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.1 - Ensure firewalld is installed (Automated) - Server1 Workstation1

rpm -q firewalld iptables | grep -E "(firewalld|iptables)" || exit $?
