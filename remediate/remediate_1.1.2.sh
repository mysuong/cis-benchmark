#!/bin/sh
# ** AUTO GENERATED **

# 1.1.2 - Ensure /tmp is configured (Automated)

if [[ -f "/etc/fstab" ]]; then
	if grep -q "/tmp" /etc/fstab; then
		sed -i 's|^.* /tmp .*$|tmpfs /tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0|' /etc/fstab
	else
		# Add a new entry for /tmp in /etc/fstab
		echo "tmpfs /tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0" | sudo tee -a /etc/fstab
	fi

	sudo mount -o remount,noexec,nodev,nosuid /tmp
else
    # Check if /etc/systemd/system/tmp.mount exists
    if [[ ! -f "/etc/systemd/system/tmp.mount" ]]; then
        # Create /etc/systemd/system/tmp.mount by copying the template file
        sudo cp -v /usr/lib/systemd/system/tmp.mount /etc/systemd/system/
    fi

    # Update /etc/systemd/system/tmp.mount
    sudo bash -c "cat > /etc/systemd/system/tmp.mount << EOL
[Mount]
What=tmpfs
Where=/tmp
Type=tmpfs
Options=mode=1777,strictatime,noexec,nodev,nosuid
EOL"

    # Reload systemd configuration
    sudo systemctl daemon-reload

    # Restart the tmp.mount unit
    sudo systemctl restart tmp.mount
fi