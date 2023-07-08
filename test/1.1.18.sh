#!/bin/sh
# ** AUTO GENERATED **

# 1.1.18 - Ensure /home partition includes the nodev option (Automated)

findmnt /home | grep nodev || exit $?
