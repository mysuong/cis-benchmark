#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.3.6 - Ensure ip6tables is enabled and running (Automated) - Server1 Workstation1

systemctl is-enabled ip6tables | grep "enabled" || exit 1

