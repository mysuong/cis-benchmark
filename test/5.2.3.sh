#!/bin/sh
# ** AUTO GENERATED **

# 5.2.3 - Ensure sudo log file exists (Automated) - Server1 Workstation1

grep -Ei '^\s*Defaults\s+([^#;]+,\s*)?logfile\s*=\s*(")?[^#;]+(")?' /etc/sudoers /etc/sudoers.d/*
