#!/bin/sh
# ** AUTO GENERATED **

# 4.2.1.4 - Ensure logging is configured (Manual) - Server1 Workstation1

grep -q "^\*.\*[^I][^I]*@" /etc/rsyslog.conf 2>/dev/null || exit 1
