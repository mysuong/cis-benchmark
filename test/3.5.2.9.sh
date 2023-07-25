#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.9 - Ensure nftables default deny firewall policy (Automated) - Server1 Workstation1

# Kiểm tra xem nftables đã được cài đặt trên hệ thống chưa
if ! command -v nft >/dev/null 2>&1; then
  exit 1
fi

# Kiểm tra policy của base chain input
if nft list ruleset | grep -q 'type filter hook input priority 0; policy drop;'; then
  echo "Base chain 'input' has a policy of DROP."
else
  exit 1
fi

# Kiểm tra policy của base chain forward
if nft list ruleset | grep -q 'type filter hook forward priority 0; policy drop;'; then
  echo "Base chain 'forward' has a policy of DROP."
else
  exit 1
fi

# Kiểm tra policy của base chain output
if nft list ruleset | grep -q 'type filter hook output priority 0; policy drop;'; then
  echo "Base chain 'output' has a policy of DROP."
else
  exit 1
fi

exit 0
