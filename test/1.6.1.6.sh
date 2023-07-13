#!/bin/sh
# ** AUTO GENERATED **

# 1.6.1.6 - Ensure no unconfined services exist (Automated) - Server1 Workstation1

out=$( ps -eZ | grep unconfined_service_t)
[[ -z"${out}"]] || exit 1
