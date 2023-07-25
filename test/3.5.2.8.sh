#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.8 - Ensure nftables outbound and established connections are configured (Manual) - Server1 Workstation1

# Kiểm tra xem nftables đã được cài đặt trên hệ thống chưa
if ! command -v nft >/dev/null 2>&1; then
  echo "nftables is not installed. This system does not meet the benchmark requirement."
  exit 1
fi

# Kiểm tra các quy tắc cho established incoming connections
incoming_protocol_rules=("tcp" "udp" "icmp")

for protocol in "${incoming_protocol_rules[@]}"; do
  if ! nft list ruleset | awk '/hook input/,/}/' | grep -q -E "ip protocol $protocol ct state established accept"; then
    echo "Audit: The rule for established incoming connection with protocol '$protocol' does not match site policy."
    exit 1
  fi
done

# Kiểm tra các quy tắc cho new and established outbound connections
outbound_protocol_rules=("tcp" "udp" "icmp")

for protocol in "${outbound_protocol_rules[@]}"; do
  if ! nft list ruleset | awk '/hook output/,/}/' | grep -q -E "ip protocol $protocol ct state (established|related|new) accept"; then
    echo "Audit: The rule for new and established outbound connection with protocol '$protocol' does not match site policy."
    exit 1
  fi
done
exit 0