#!/bin/sh
# ** AUTO GENERATED **

# 1.7.2 - Ensure local login warning banner is configured properly (Automated) - Server1 Workstation1

out=$(egrep '(\\v|\\r|\\m|\\s)' /etc/issue)
[[ -z "${out}" ]] || exit 1
