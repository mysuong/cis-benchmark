#!/bin/sh
# ** AUTO GENERATED **

# 2.2.10 - Ensure IMAP and POP3 server is not installed (Automated) - Server1 Workstation1

rpm -q dovecot | grep -E "(package dovecot is not installed)" || exit $?