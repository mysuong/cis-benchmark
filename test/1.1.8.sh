#!/bin/sh
# ** AUTO GENERATED **

# 1.1.8 - Ensure nodev option set on /dev/shm partition (Automated) - Server1 Workstation1

findmnt /dev/shm | grep nodev || exit $?
