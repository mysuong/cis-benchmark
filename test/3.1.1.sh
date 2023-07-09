#!/bin/sh
# ** AUTO GENERATED **

# 3.1.1 - Disable IPv6 (Manual) - Server2 Workstation2

sysctl net.ipv6.conf.all.disable_ipv6 | grep "net.ipv6.conf.all.disable_ipv6 = 1" || exit $?
sysctl net.ipv6.conf.default.disable_ipv6 | grep "net.ipv6.conf.default.disable_ipv6 = 1" || exit $?
ipv6_status="disabled"


