#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.2.4 - Ensure iptables default deny firewall policy (Automated) - Server1 Workstation1

iptables -L | grep -E "Chain\s(INPUT)" | grep -E "(DROP|REJECT)" || exit 1
iptables -L | grep -E "Chain\s(FORWARD)" | grep -E "(DROP|REJECT)" || exit 1
iptables -L | grep -E "Chain\s(OUTPUT)" | grep -E "(DROP|REJECT)" || exit 1