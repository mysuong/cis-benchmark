#!/bin/sh
# ** AUTO GENERATED **

# 1.1.14 -  Ensure /var/tmp partition includes the nosuid option (Automated) - Server1 Workstation1

findmnt /var/tmp | grep nosuid || exit $?
