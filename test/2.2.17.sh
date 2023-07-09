#!/bin/sh
# ** AUTO GENERATED **

# 2.2.17 - Ensure nfs-utils is not installed or the nfs-server service is masked (Automated) - Server1 Workstation1

systemctl is-enabled nfs-utils 2>&1 | grep -E "(masked|disabled|No such file or directory)" || exit $?

