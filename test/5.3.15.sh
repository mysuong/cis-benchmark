#!/bin/sh
# ** AUTO GENERATED **

# 5.3.15 - Ensure only strong Key Exchange algorithms are used (Automated) - Server1 Workstation1

sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Ei '^\s*kexalgorithms\s+([^#]+,)?(diffie-hellman-group1-sha1|diffie-hellman- group14-sha1|diffiehellman-group-exchange-sha1)\b' || exit $?