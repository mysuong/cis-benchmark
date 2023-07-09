#!/bin/sh
# ** AUTO GENERATED **

# 2.2.8 - Ensure FTP Server is not installed (Automated) - Server1 Workstation1

systemctl is-enabled vsftpd 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?
