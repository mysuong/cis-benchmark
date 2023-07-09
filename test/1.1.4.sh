#!/bin/sh
# ** AUTO GENERATED **

# 1.1.4 - Ensure nodev option set on /tmp partition (Automated) - Server1 Workstation1

findmnt /tmp | grep nodev || exit $?