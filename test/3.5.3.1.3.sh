#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.1.3 - Ensure firewalld is either not installed or masked with iptables (Automated) - Server1 Workstation1

# systemctl is-enabled firewalld 2>&1 | grep -E "(masked|disabled|No such file or directory)" || exit $?
# Kiểm tra xem firewalld đã được cài đặt trên hệ thống chưa
if rpm -q firewalld >/dev/null 2>&1; then
  echo "Audit: Firewalld is installed on the system. This does not meet the benchmark requirement."
  exit 1
fi

# Kiểm tra trạng thái của firewalld
if systemctl status firewalld | grep -q "Active: " && systemctl status firewalld | grep -v -q "active (running)"; then
  echo "Audit: Firewalld is stopped on the system."
else
  echo "Audit: Firewalld is either running or not stopped properly."
  exit 1
fi

# Kiểm tra xem firewalld đã được masked (vô hiệu hóa) hay chưa
if systemctl is-enabled firewalld | grep -q "masked"; then
  echo "Audit: Firewalld is masked (disabled) on the system."
else
  echo "Audit: Firewalld is not masked (disabled) properly."
  exit 1
fi

exit 0