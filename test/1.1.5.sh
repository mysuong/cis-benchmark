#!/bin/sh
# ** AUTO GENERATED **

# 1.1.5 - Ensure nosuid option set on /tmp partition (Automated)
findmnt /tmp | grep nosuid || exit $?