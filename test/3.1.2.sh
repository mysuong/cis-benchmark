#!/bin/sh
# ** AUTO GENERATED **

# 3.1.2 - Ensure wireless interfaces are disabled (Automated) - Server1 Workstation2

networkstatus="$(systemctl is-enabled NetworkManager 2>&1 | grep -E '(disabled|No such file or directory)')"
if [[ -n "${networkstatus}" ]]; then
    exit 0
fi
# Check disable wireless via nmcli & wireless configuration
if command -v nmcli >/dev/null 2>&1 ; then
    nmcli radio all > /dev/null 2>/dev/null
    if [[ $? -eq 0 ]]; then
    if nmcli radio all | grep -Eq '\s*\S+\s+disabled\s+\S+\s+disabled\b'; then
    exit 0
    else
    exit 1
    fi
    else
    exit 0
    fi
fi
if [ -n ""$(find /sys/class/net/*/ -type d -name wireless)"" ]; then
    t=0
    mname=$(for driverdir in $(find /sys/class/net/*/ -type d -name wireless | xargs -0 dirname); do
    basename ""$(readlink -f ""$driverdir""/device/driver/module)""; done | sort -u)
    for dm in $mname; do
    if grep -Eq ""^\s*install\s+$dm\s+/bin/(true|false)"" /etc/modprobe.d/*.conf; then
    /bin/true
    else
    exit 1
    t=1
    fi
    done
    [ ""$t"" -eq 0 ] && exit 0
else
    exit 0
fi


