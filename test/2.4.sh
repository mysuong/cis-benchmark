#!/bin/sh
# ** AUTO GENERATED **

# 2.4 - Ensure nonessential services are removed or masked (Manual) - Server1 Workstation1

lsof -i -P -n | grep -v "(ESTABLISHED)" 
exit 2