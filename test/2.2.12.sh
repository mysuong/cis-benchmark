#!/bin/sh
# ** AUTO GENERATED **

# 2.2.12 - Ensure HTTP Proxy Server is not installed (Automated) - Server1 Workstation1

systemctl is-enabled squid 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?
