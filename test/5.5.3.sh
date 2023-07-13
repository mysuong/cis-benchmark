#!/bin/sh
# ** AUTO GENERATED **

# 5.5.3 - Ensure default group for the root account is GID 0 (Automated) - Server1 Workstation1

gid=$(grep "^root:" /etc/passwd | cut -f4 -d:)
if [[ ${gid} -ne 0 ]]; then exit 1; fi