#!/bin/sh
# ** AUTO GENERATED **

# 2.2.14 - Ensure NIS server is not installed (Automated) - Server1 Workstation1

systemctl is-enabled ypserv 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?
