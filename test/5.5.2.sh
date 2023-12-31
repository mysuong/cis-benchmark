#!/bin/sh
# ** AUTO GENERATED **

# 5.5.2 - Ensure system accounts are secured (Automated) - Server1 Workstation1

out=$(awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' && $7!="'"$ (which nologin)"'" && $7!="/bin/false") {print}' /etc/passwd)
[[ -z ${out} ]] || exit 1
out2=$(awk -F: '($1!="root" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"') {print $1}' /etc/passwd | xargs -I '{}' passwd -S '{}' | awk '($2!="L" && $2!="LK") {print $1}')
[[ -z ${out2} ]] || exit 1