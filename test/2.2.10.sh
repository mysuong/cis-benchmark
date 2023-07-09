#!/bin/sh
# ** AUTO GENERATED **

# 2.2.10 - Ensure IMAP and POP3 server is not installed (Automated) - Server1 Workstation1

systemctl is-enabled dovecot 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?