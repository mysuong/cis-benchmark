#!/bin/sh
# ** AUTO GENERATED **

# 6.2.4 - Ensure shadow group is empty (Automated) - Server1 Workstation1

out=$(awk -F: '($1=="shadow") {print $NF}' /etc/group)
[[ -z ${out} ]] || exit 1
awk -F: -v GID="$(awk -F: '($1=="shadow") {print $3}' /etc/group)" '($4==GID) {exit 1}' /etc/passwd
