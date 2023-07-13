#!/bin/sh
# ** AUTO GENERATED **

# 5.7 - Ensure access to the su command is restricted (Automated) - Server1 Workstation1

line=$(grep -Pi '^\h*auth\h+(?:required|requisite)\h+pam_wheel\.so\h+(?:[^#\n\r]+\h+)?((?!\2)(use_uid\b|group=\H+\b))\h+(?:[^#\n\r]+\h+)?((?!\1)(use_uid\b|group=\H+\b))(\h+.*)?$' /etc/pam.d/su)
groupname=$(echo ${line} | grep -E -o "\bgroup=\S+\b" | cut -d= -f2)
list_of_users=$(grep -E "^${groupname}:" /etc/group | cat -d: -f4)
[[ -z ${list_of_users} ]] || exit 1