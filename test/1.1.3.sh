#!/bin/sh
# ** AUTO GENERATED **

# 1.1.3 - Ensure noexec option set on /tmp partition (Automated) - Server1 Workstation1

findmnt -n  /tmp | grep noexec || exit $?
