#!/bin/sh
# ** AUTO GENERATED **

# 1.1.13 - Ensure /var/tmp partition includes the nodev option (Automated)

findmnt /var/tmp | grep nodev || exit $?
