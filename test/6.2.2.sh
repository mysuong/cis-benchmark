#!/bin/sh
# ** AUTO GENERATED **

# 6.2.2 - Ensure /etc/shadow password fields are not empty (Automated) - Server1 Workstation1

awk -F: '($2 == "" ) {exit 1}' /etc/passwd
