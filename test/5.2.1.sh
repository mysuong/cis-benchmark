#!/bin/sh
# ** AUTO GENERATED **

# 5.2.1 - Ensure sudo is installed (Automated) - Server1 Workstation1

rpm -q sudo | grep -E "sudo" || exit $?
