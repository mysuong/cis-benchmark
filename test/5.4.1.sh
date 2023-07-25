#!/bin/sh
# ** AUTO GENERATED **

# 5.4.1 - Ensure password creation requirements are configured (Automated) - Server1 Workstation1

# Kiểm tra xem file cấu hình pwquality.conf tồn tại
if [[ -e "/etc/security/pwquality.conf" ]]; then
    # Kiểm tra xem các cấu hình đã được thiết lập trong file pwquality.conf
    minlen_setting=$(grep '^\s*minlen\s*' /etc/security/pwquality.conf | awk -F= '{print $2}' | tr -d ' ')
    minclass_setting=$(grep '^\s*minclass\s*' /etc/security/pwquality.conf | awk -F= '{print $2}' | tr -d ' ')
    
    # Kiểm tra xem các cấu hình đáp ứng yêu cầu của tiêu chuẩn hay không
    if [[ "$minlen_setting" -ge 14 && "$minclass_setting" -ge 4 ]]; then
        exit 0
    else
        exit 1
    fi
else
    exit 1
fi
