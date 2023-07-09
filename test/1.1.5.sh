#!/bin/sh
# ** AUTO GENERATED **

# 1.1.5 - Ensure nosuid option set on /tmp partition (Automated) - Server1 Workstation1
findmnt /tmp | grep nosuid || exit $?
