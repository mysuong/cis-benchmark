#!/bin/sh
# ** AUTO GENERATED **

# 1.1.2 - Ensure /tmp is configured (Automated)

#!/bin/bash

# Verify if /tmp is mounted as tmpfs or a system partition
# findmnt -n /tmp | grep -q "tmpfs"

# if [[ $? -eq 0 ]]; then
#     echo "/tmp is mounted as tmpfs"
# else
#     echo "/tmp is not mounted as tmpfs"
# fi

# # Check if /etc/fstab is used
# if [[ -f "/etc/fstab" ]]; then
#     # Verify if tmpfs has been mounted to /tmp in /etc/fstab
#     grep -E '\s/tmp\s' /etc/fstab | grep -E -v '^\s*#' | grep -q "tmpfs"

#     if [[ $? -eq 0 ]]; then
#         exit 1
#     else
#         exit 0
#     fi
# else
#     # Check if systemd tmp.mount file is used
#     systemctl show "tmp.mount" | grep -i UnitFileState | grep -q "enabled"

#     if [[ $? -eq 0 ]]; then
#         exit 1
#     else
#         exit 0
#     fi
# fi

findmnt /tmp || exit $?
