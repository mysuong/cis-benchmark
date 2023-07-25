#!/bin/sh
# ** AUTO GENERATED **

# 4.2.4 - Ensure logrotate is configured (Manual) - Server1 Workstation1

cat /etc/logrotate.conf | tr '\n' '\r' | sed -e 's/{.*}//g' | tr '\r' '\n' | grep -v "^\s*#" | grep "maxage" || exit$?