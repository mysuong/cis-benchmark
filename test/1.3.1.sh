#!/bin/sh
# ** AUTO GENERATED **

# 1.3.1 - Ensure AIDE is installed (Automated) - Server1 Workstation1

rpm -q aide | grep "aide-" || exit $?
