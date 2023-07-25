#!/bin/sh
# ** AUTO GENERATED **

# 2.2.18 - Ensure rpcbind is not installed or the rpcbind services are masked (Automated) - Server1 Workstation1

systemctl is-enabled rpcbind | grep masked || exit $?
systemctl is-enabled rpcbind.socket 2>&1 | grep -E "(enabled|masked)" || exit $
