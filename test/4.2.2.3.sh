#!/bin/sh
# ** AUTO GENERATED **

# 4.2.2.3 - Ensure journald is configured to write logfiles to persistent disk (Automated) - Server1 Workstation1

perm=$(grep -E ^\s*Storage /etc/systemd/journald.conf)
[[ -z "${perm}" ]] || exit 1
