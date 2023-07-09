#!/bin/sh
# ** AUTO GENERATED **

# 1.1.18 - Ensure /home partition includes the nodev option (Automated) - Server1 Workstation1

findmnt /home | grep nodev || exit $?
