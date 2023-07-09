#!/bin/sh
# ** AUTO GENERATED **

# 2.2.6 - Ensure LDAP server is not installed (Automated) - Server1 Workstation1

systemctl is-enabled openldap-servers 2>&1 | grep -E "(disabled|No such file or directory)" || exit $?
