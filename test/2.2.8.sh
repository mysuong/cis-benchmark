#!/bin/sh
# ** AUTO GENERATED **

# 2.2.8 - Ensure FTP Server is not installed (Automated) - Server1 Workstation1

rpm -q vsftpd | grep -E "(package vsftpd is not installed)" || exit $?
