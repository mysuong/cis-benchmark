#!/bin/sh
# ** AUTO GENERATED **

# 3.5.3.3.3 - Ensure ip6tables firewall rules exist for all open ports (Automated)" - Server1 Workstation1

# Get a list of all open TCP and UDP ports using "ss" command
open_ports_tcp=$(ss -6tuln | grep "^tcp" | grep "LISTEN" | awk '{print $5}' | cut -d":" -f2)
open_ports_udp=$(ss -6tuln | grep "^udp" | grep "UNCONN" | awk '{print $5}' | cut -d":" -f2)

# Function to check if a port is ACCEPTED in ip6tables INPUT chain
check_port_accepted() {
  local protocol=$1
  local port=$2
  ip6tables -L INPUT -v -n | grep -q "ACCEPT\s*$protocol.*:$port"
}

# Check each TCP port
for port in $open_ports_tcp; do
  echo "Checking TCP port $port"
  if ! check_port_accepted "tcp" "$port"; then
    echo "TCP port $port is not ACCEPTED in ip6tables INPUT chain."
    exit 1
  fi
done

# Check each UDP port
for port in $open_ports_udp; do
  echo "Checking UDP port $port"
  if ! check_port_accepted "udp" "$port"; then
    echo "UDP port $port is not ACCEPTED in ip6tables INPUT chain."
    exit 1
  fi
done

# All ports are ACCEPTED, exit with success
echo "All open ports have ip6tables firewall rules in place."
exit 0