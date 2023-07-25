#!/bin/sh
# ** AUTO GENERATED **

# 1.5.3 - Ensure address space layout randomization (ASLR) is enabled (Automated) - Server1 Workstation1

sysctl kernel.randomize_va_space | grep -E "kernel.randomize_va_space = 2" && exit 0
grep "kernel.randomize_va_space" /etc/sysctl.conf /etc/sysctl.d/* | grep -E "kernel.randomize_va_space = 2" || exit $?