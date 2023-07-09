#!/bin/sh
# ** AUTO GENERATED **

# 1.7.1.1 - Ensure message of the day is configured properly (Automated) - Server1 Workstation1

out=$(egrep '(\\v|\\r|\\m|\\s)' /etc/motd)
[[ -z "${out}" ]] || exit 1
