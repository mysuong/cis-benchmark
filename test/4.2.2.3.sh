#!/bin/sh
# ** AUTO GENERATED **

# 4.2.2.3 - Ensure journald is configured to write logfiles to persistent disk (Automated) - Server1 Workstation1

perm=$(grep ^options /etc/syslog-ng/syslog-ng.conf | sed "s/^.* perm\(([0-9]*)\).*$/\1/" | sed "s/[^0-9]//g")

[[ "$perm" =~ 0[0-6][0-4]0$ ]] || exit;
