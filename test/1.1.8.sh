#!/bin/sh
# ** AUTO GENERATED **

# 1.1.8 - Ensure nodev option set on /dev/shm partition (Automated)

findmnt /dev/shm | grep nodev || exit $?
