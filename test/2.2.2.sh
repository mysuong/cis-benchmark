#!/bin/sh
# ** AUTO GENERATED **

# 2.2.2 - Ensure X11 Server components are not installed (Automated) - Server1 Workstation1

out=$(rpm -qa xorg-x11*)
[[ -z "${out}" ]] || exit 1
