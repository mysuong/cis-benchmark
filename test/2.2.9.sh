#!/bin/sh
# ** AUTO GENERATED **

# 2.2.9 - Ensure HTTP server is not installed (Automated) - Server1 Workstation1

rpm -q httpd | grep -E "(package httpd is not installed)" || exit $?