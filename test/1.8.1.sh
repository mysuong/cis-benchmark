#!/bin/sh
# ** AUTO GENERATED **

# 1.8.1 - Ensure GNOME Display Manager is removed (Manual) - Server2 Workstation2

rpm -q gdm | grep -E "package gdm is not installed" || exit $?
