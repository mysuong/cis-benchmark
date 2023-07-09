#!/bin/sh
# ** AUTO GENERATED **

# 1.8.4 - Ensure XDCMP is not enabled (Automated) - Server1 Workstation1

out="$(grep -Eis '^\s*Enable\s*=\s*true' /etc/gdm/custom.conf)"
[[ -z "${out}" ]] || exit $1