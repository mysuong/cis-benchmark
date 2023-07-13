#!/bin/sh
# ** AUTO GENERATED **

# 4.2.1.2 - Ensure rsyslog Service is enabled and running (Automated) - Server1 Workstation1

grep "\*.emerg\s*\t*:omusrmsg:\*" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "mail.\*\s*\t*-?/var/log/mail" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "mail.info\s*\t*-?/var/log/mail.info" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "mail.warning\s*\t*-?/var/log/mail.warn" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "mail.err\s*\t*/var/log/mail.err" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "news.crit\s*\t*-?/var/log/news/news.crit" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "news.err\s*\t*-?/var/log/news/news.err" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "news.notice\s*\t*-?/var/log/news/news.notice" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "\*.=warning;\*.=err\s*\t*-?/var/log/warn" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "\*.crit\s*\t*/var/log/warn" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "\*.\*;mail.none;news.none\s*\t*-?/var/log/messages" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "local0,local1.\*\s*\t*-?/var/log/localmessages" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "local2,local3.\*\s*\t*-?/var/log/localmessages" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "local4,local5.\*\s*\t*-?/var/log/localmessages" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
grep "local6,local7.\*\s*\t*-?/var/log/localmessages" /etc/rsyslog.conf /etc/rsyslog.d/*.conf || exit 1
