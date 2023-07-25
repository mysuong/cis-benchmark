#!/bin/sh
# ** AUTO GENERATED **

# 2.2.11 - Ensure Samba is not installed (Automated) - Server1 Workstation1

rpm -q samba | grep -E "(package samba is not installed)" || exit $?
