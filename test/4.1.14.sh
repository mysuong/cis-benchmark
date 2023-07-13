#!/bin/sh
# ** AUTO GENERATED **

# 4.1.14 - Ensure changes to system administration scope (sudoers) is collected (Automated) - Server2 Workstation2

cut -d\# -f1 /etc/audit/audit.rules | egrep "\-k[[:space:]]+scope" | egrep "\-p[[:space:]]+wa" | egrep -q "\-w[[:space:]]+\/etc\/sudoers" || exit 1
