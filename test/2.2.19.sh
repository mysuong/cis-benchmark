#!/bin/sh
# ** AUTO GENERATED **

# 2.2.19 - Ensure rsync is not installed or the rsyncd service is masked (Automated) - Server1 Workstation1

systemctl is-enabled rsyncd 2>&1 | grep -E "(masked|disabled|No such file or directory)"
