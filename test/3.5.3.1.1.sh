#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.1.1 - Ensure iptables packages are installed (Automated) - Server1 Workstation1

rpm -q iptables | grep -E "(iptables-)" || exit $?