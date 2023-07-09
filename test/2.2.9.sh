#!/bin/sh
# ** AUTO GENERATED **

# 2.2.9 - Ensure HTTP server is not installed (Automated) - Server1 Workstation1

systemctl is-enabled httpd 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?