#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.6 - Ensure nftables base chains exist (Automated) - Server1 Workstation1

#nft list ruleset | grep 'hook input' | grep -E "(type filter hook input priority 0;)" || exit $?
#nft list ruleset | grep 'hook forward' | grep -E "(type filter hook forward priority 0;)" || exit $?
#nft list ruleset | grep 'hook output' | grep -E "(type filter hook output priority 0;)" || exit $?

# Kiểm tra xem nftables đã được cài đặt trên hệ thống chưa
if ! command -v nft >/dev/null 2>&1; then
  echo "nftables is not installed. This system does not meet the benchmark requirement."
  exit 1
fi

# Kiểm tra xem base chains đã được tạo trong nftables hay không
base_chains=("input" "forward" "output")

for chain in "${base_chains[@]}"; do
  if ! nft list ruleset | grep -q "type filter hook $chain priority 0"; then
    echo "Base chain 'hook $chain' not found. This system does not meet the benchmark requirement."
    exit 1
  fi
done

echo "All base chains exist. This system meets the benchmark requirement."
exit 0