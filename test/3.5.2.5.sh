#!/bin/sh
# ** AUTO GENERATED **

# 3.5.2.5 - Ensure an nftables table exists (Automated) - Server1 Workstation1

#nft list tables || exit $?
#!/bin/bash

# Kiểm tra xem nftables đã được cài đặt trên hệ thống chưa
if ! command -v nft >/dev/null 2>&1; then
  echo "nftables is not installed. This system does not meet the benchmark requirement."
  exit 1
fi

# Kiểm tra xem có bảng nào đã được tạo trong nftables hay không
if nft list tables &>/dev/null; then
  echo "An nftables table exists. This system meets the benchmark requirement."
else
  echo "No nftables table found. This system does not meet the benchmark requirement."
  exit 1
fi

exit 0