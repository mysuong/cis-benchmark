#!/bin/sh
# ** AUTO GENERATED **

# 1.1.7 - Ensure noexec option set on /dev/shm partition (Automated) - Server1 Workstation1

#findmnt /dev/shm | grep noexec || exit $?
mount | grep /dev/shm | grep noexec || exit $?