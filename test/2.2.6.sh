#!/bin/sh
# ** AUTO GENERATED **

# 2.2.6 - Ensure LDAP server is not installed (Automated) - Server1 Workstation1

rpm -q openldap-servers | grep -E "(package openldap-servers is not installed)" || exit $?
