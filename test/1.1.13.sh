#!/bin/sh
# ** AUTO GENERATED **

# 1.1.13 - Ensure /var/tmp partition includes the nodev option (Automated) - Server1 Workstation1

findmnt /var/tmp | grep nodev || exit $?
