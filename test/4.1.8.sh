#!/bin/sh
# ** AUTO GENERATED **

# 4.1.8 - Ensure session initiation information is collected (Automated) - Server2 Workstation2

cut -d\# -f1 /etc/audit/audit.rules | egrep "\-k[[:space:]]+session" | egrep "\-p[[:space:]]+wa" | egrep -q "\-w[[:space:]]+\/var\/run\/utmp" || exit 1
cut -d\# -f1 /etc/audit/audit.rules | egrep "\-k[[:space:]]+logins" | egrep "\-p[[:space:]]+wa" | egrep -q "\-w[[:space:]]+\/var\/log\/wtmp" || exit 1
cut -d\# -f1 /etc/audit/audit.rules | egrep "\-k[[:space:]]+logins" | egrep "\-p[[:space:]]+wa" | egrep -q "\-w[[:space:]]+\/var\/log\/btmp" || exit 1