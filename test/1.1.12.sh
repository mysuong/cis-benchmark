#!/bin/sh
# ** AUTO GENERATED **

# 1.1.12 - Ensure /var/tmp partition includes the noexec option (Automated)

findmnt /var/tmp | grep noexec || exit $?

