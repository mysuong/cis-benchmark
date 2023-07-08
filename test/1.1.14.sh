#!/bin/sh
# ** AUTO GENERATED **

# 1.1.14 -  Ensure /var/tmp partition includes the nosuid option (Automated)

findmnt /var/tmp | grep nosuid || exit $?
