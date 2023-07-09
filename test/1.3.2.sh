#!/bin/sh
# ** AUTO GENERATED **

# 1.3.2 - Ensure filesystem integrity is regularly checked (Automated) - Server1 Workstation1

check_1="$(grep -r aide /etc/cron.* /etc/crontab)"
check_2="$(crontab -u root -l | grep aide)"
# check services
check_3="$(systemctl is-enabled aidecheck.service 2>&1 | grep 'enabled')"
check_4="$(systemctl is-enabled aidecheck.timer 2>&1 | grep 'enabled')"
[[ "${check_1}" || "${check_2}" || "${check_3}" || "${check_4}" ]] || exit 1
