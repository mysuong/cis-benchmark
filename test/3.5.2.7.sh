#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.7 - Ensure nftables loopback traffic is configured (Automated) - Server1 Workstation1

# Kiểm tra xem nftables đã được cài đặt trên hệ thống chưa
if ! command -v nft >/dev/null 2>&1; then
  echo "nftables is not installed."
  exit 1
fi

# Kiểm tra loopback interface trên IPv4
if nft list ruleset | awk '/hook input/,/}/' | grep -q 'iif "lo" accept' && nft list ruleset | awk '/hook input/,/}/' | grep -q 'ip saddr 127.0.0.0/8 counter packets 0 bytes 0 drop'; then
  echo "IPv4 loopback interface is configured correctly."
else
  exit 1
fi

# Kiểm tra loopback interface trên IPv6 nếu IPv6 được bật
if ip6tables -L INPUT -v -n | grep -q 'ACCEPT\s*all.*::1'; then
  echo "IPv6 loopback interface is configured correctly."
else
  exit 1
fi

exit 0