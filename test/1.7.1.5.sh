#!/bin/sh
# ** AUTO GENERATED **

# 1.7.1.5 - Ensure permissions on /etc/issue are configured (Automated) - Server1 Workstation1

stat -L -c "%a %u %g" /etc/issue | grep -q "644 0 0$" || exit $?
