#!/bin/sh
# ** AUTO GENERATED **

# 1.1.9 - Ensure nosuid option set on /dev/shm partition (Automated) - Server1 Workstation1

findmnt /dev/shm | grep nosuid || exit $?

