#!/bin/sh
# ** AUTO GENERATED **

# 6.2.1 - Ensure accounts in /etc/passwd use shadowed passwords (Automated) - Server1 Workstation1

awk -F: '($2 != "x" ) {exit 1}' /etc/passwd
