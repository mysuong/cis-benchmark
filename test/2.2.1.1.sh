#!/bin/sh
# ** AUTO GENERATED **

# 2.2.1.1 - Ensure time synchronization is in use (Manual) - Server1 Workstation1

rpm -q chrony ntp | grep "chrony-" || rpm -q ntp | grep "ntp-" || exit $?
