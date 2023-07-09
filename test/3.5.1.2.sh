#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.2 - Ensure iptables-services not installed with firewalld - Server1 Workstation1

rpm -q iptables-services | grep "package iptables-services is not installed" || exit $?