#!/bin/sh
# ** AUTO GENERATED **

# 1.7.1.1 - Ensure message of the day is configured properly (Automated) - Server1 Workstation1

out=$( grep -E -i "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/motd)
[[ -z "${out}" ]] || exit 1
