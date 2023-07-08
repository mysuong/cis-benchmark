#!/bin/sh
# ** AUTO GENERATED **

# 1.1.10 - Ensure separate partition exists for /var (Automated)

findmnt /var || exit $?
