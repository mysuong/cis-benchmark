#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.3.4 - Ensure ip6tables default deny firewall policy (Automated) - Server1 Workstation1

ip6tables -L | grep -E "Chain\s(INPUT)" | grep -E "(DROP|REJECT)" || exit 1
ip6tables -L | grep -E "Chain\s(FORWARD)" | grep -E "(DROP|REJECT)" || exit 1
ip6tables -L | grep -E "Chain\s(OUTPUT)" | grep -E "(DROP|REJECT)" || exit 1

