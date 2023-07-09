#!/bin/sh
# ** AUTO GENERATED **

# 3.5.1.5 - Ensure firewalld default zone is set (Automated) - Server1 Workstation1

systemctl is-enabled firewalld | grep "enabled" || exit $?
firewall-cmd --get-default-zone || exit $?
