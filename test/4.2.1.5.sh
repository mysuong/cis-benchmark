#!/bin/sh
# ** AUTO GENERATED **

# 4.2.1.5 - Ensure rsyslog is configured to send logs to a remote log host (Automated) - Server1 Workstation1

if [[ $(ls -A /etc/rsyslog.d/) ]] ; then
        grep '$ModLoad imtcp' /etc/rsyslog.conf /etc/rsyslog.d/*.conf | grep '$ModLoad imtcp' || exit 1
        grep '$InputTCPServerRun' /etc/rsyslog.conf /etc/rsyslog.d/*.conf | grep '$InputTCPServerRun 514' || exit 1
else
        grep '$ModLoad imtcp' /etc/rsyslog.conf | grep '$ModLoad imtcp' || exit 1
        grep '$InputTCPServerRun' /etc/rsyslog.conf | grep '$InputTCPServerRun 514' || exit 1
fi
