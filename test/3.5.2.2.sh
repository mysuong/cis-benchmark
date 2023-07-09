#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.1 - Ensure firewalld is either not installed or masked with nftables (Automated) - Server1 Workstation1

rpm -q firewalld | grep -E "(package firewalld is not installed)" || exit $?
systemctl is-enabled firewalld | grep -E "(masked)" || exit $?