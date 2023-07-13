#!/bin/sh
# ** AUTO GENERATED **

# 6.1.11 - Ensure no unowned files or directories exist (Automated) - Server1 Workstation1

df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser || exit $?
