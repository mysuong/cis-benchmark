#!/bin/sh
# ** AUTO GENERATED **

# 6.1.2 - Ensure permissions on /etc/passwd are configured (Scored)

stat -L -c "%a %u %g" /etc/passwd | grep -q "644 0 0$" || exit $?
