#!/bin/sh
# ** AUTO GENERATED **

# 2.2.7 -  Ensure DNS Server is not installed (Automated) - Server1 Workstation1

rpm -q bind | grep -E "(package bind is not installed)" || exit $?
