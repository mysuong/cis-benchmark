#!/bin/sh
# ** AUTO GENERATED **

# 2.2.15 -  Ensure telnet-server is not installed (Automated) - Server1 Workstation1

systemctl is-enabled telnet-server 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?
