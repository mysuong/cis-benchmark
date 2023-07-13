#!/bin/sh
# ** AUTO GENERATED **

# 5.3.19 - Ensure SSH PAM is enabled (Automated) - Server1 Workstation1

sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i usepam || exit $?