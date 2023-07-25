#!/bin/sh
# ** AUTO GENERATED **

# 2.2.2 - Ensure X11 Server components are not installed (Automated) - Server1 Workstation1

systemctl is-enabled xorg-x11-server* 2>&1 | grep -E "disabled|No such file or directory" || exit $?
