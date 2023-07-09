#!/bin/sh
# ** AUTO GENERATED **

# 2.2.18 - Ensure rpcbind is not installed or the rpcbind services are masked (Automated) - Server1 Workstation1

systemctl is-enabled rpcbind 2>&1 | grep -E "(masked|disabled|No such file or directory)" || exit $?
systemctl is-enabled rpcbind.socket 2>&1 | grep -E "(masked|disabled|No such file or directory)" || exit $?
