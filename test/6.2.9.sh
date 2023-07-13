#!/bin/sh
# ** AUTO GENERATED **

# 6.2.9 - Ensure root is the only UID 0 account (Automated) - Server1 Workstation1

awk -F: '($3 == 0 && $1 != "root") { exit 1 }' /etc/passwd
