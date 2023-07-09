#!/bin/sh
# ** AUTO GENERATED **

# 1.5.1 - Ensure core dumps are restricted (Automated) - 

grep -E "^\s*\*\s+hard\s+core\s+0" /etc/security/limits.conf /etc/security/limits.d/* || exit $?
sysctl fs.suid_dumpable | grep -E "fs.suid_dumpable = 0" && exit 0
grep "suid_dumpable" /etc/sysctl.conf /etc/sysctl.d/* | grep -E "fs.suid_dumpable\s*=\s*0" || exit $?
