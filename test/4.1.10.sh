#!/bin/sh
# ** AUTO GENERATED **

# 4.1.10 - Ensure unsuccessful unauthorized file access attempts are collected (Automated) - Server2 Workstation2

cut -d\# -f1 /etc/audit/audit.rules | egrep "\-k[[:space:]]+access" | egrep "\-S[[:space:]]+creat" | egrep "\-S[[:space:]]+open" | egrep "\-S[[:space:]]+openat" | egrep "\-S[[:space:]]+truncate" | egrep "\-S[[:space:]]+ftruncate" | egrep "\-F[[:space:]]+arch=b64" | egrep "\-F[[:space:]]+auid>=500" | egrep "\-F[[:space:]]+auid\!=4294967295" | egrep "\-F[[:space:]]exit=\-EACCES" | egrep -q "\-a[[:space:]]+always,exit|\-a[[:space:]]+exit,always" || exit 1

cut -d\# -f1 /etc/audit/audit.rules | egrep "\-k[[:space:]]+access" | egrep "\-S[[:space:]]+creat" | egrep "\-S[[:space:]]+open" | egrep "\-S[[:space:]]+openat" | egrep "\-S[[:space:]]+truncate" | egrep "\-S[[:space:]]+ftruncate" | egrep "\-F[[:space:]]+arch=b32" | egrep "\-F[[:space:]]+auid>=500" | egrep "\-F[[:space:]]+auid\!=4294967295" | egrep "\-F[[:space:]]exit=\-EACCES" | egrep -q "\-a[[:space:]]+always,exit|\-a[[:space:]]+exit,always" || exit 1

cut -d\# -f1 /etc/audit/audit.rules | egrep "\-k[[:space:]]+access" | egrep "\-S[[:space:]]+creat" | egrep "\-S[[:space:]]+open" | egrep "\-S[[:space:]]+openat" | egrep "\-S[[:space:]]+truncate" | egrep "\-S[[:space:]]+ftruncate" | egrep "\-F[[:space:]]+arch=b64" | egrep "\-F[[:space:]]+auid>=500" | egrep "\-F[[:space:]]+auid\!=4294967295" | egrep "\-F[[:space:]]exit=\-EPERM" | egrep -q "\-a[[:space:]]+always,exit|\-a[[:space:]]+exit,always" || exit 1

cut -d\# -f1 /etc/audit/audit.rules | egrep "\-k[[:space:]]+access" | egrep "\-S[[:space:]]+creat" | egrep "\-S[[:space:]]+open" | egrep "\-S[[:space:]]+openat" | egrep "\-S[[:space:]]+truncate" | egrep "\-S[[:space:]]+ftruncate" | egrep "\-F[[:space:]]+arch=b32" | egrep "\-F[[:space:]]+auid>=500" | egrep "\-F[[:space:]]+auid\!=4294967295" | egrep "\-F[[:space:]]exit=\-EPERM" | egrep -q "\-a[[:space:]]+always,exit|\-a[[:space:]]+exit,always" || exit 1