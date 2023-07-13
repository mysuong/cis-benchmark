#!/bin/sh
# ** AUTO GENERATED **

# 5.2.2 - Ensure sudo commands use pty (Automated) - Server1 Workstation1

grep -Ei '^\s*Defaults\s+([^#]\S+,\s*)?use_pty\b' /etc/sudoers /etc/sudoers.d/*
