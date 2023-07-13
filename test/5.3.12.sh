#!/bin/sh
# ** AUTO GENERATED **

# 5.3.12 - Ensure SSH PermitUserEnvironment is disabled (Automated) - Server1 Workstation1

grep "^\s*PermitUserEnvironment" /etc/ssh/sshd_config | grep -q "PermitUserEnvironment\s*no" || exit $?
