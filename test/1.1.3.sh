#!/bin/sh
# ** AUTO GENERATED **

# 1.1.3 - Ensure noexec option set on /tmp partition (Scored)

# mount | grep /tmp | grep noexec || exit $? -> version 2.
findmnt -n /tmp | grep -Ev '\bnodev\b' || exit $?