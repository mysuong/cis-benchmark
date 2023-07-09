#!/bin/sh
# ** AUTO GENERATED **

# 1.2.3 - Ensure gpgcheck is globally activated (Automated) - Server1 Workstation1

non_compliance="$(grep ^gpgcheck /etc/yum.conf /etc/yum.repos.d/* | grep -E 'gpgcheck\s*=\s*[^1]' )"
[[ -z "${non_compliance}" ]] || exit $?
