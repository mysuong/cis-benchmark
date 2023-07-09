#!/bin/sh

test_wrapper() {
	local ref=$1
	shift
	local msg=$1
	shift
	local score=$1
	shift
	local server=$1
	shift
	local workstation=$1

	RED='\033[0;31m'
	GREEN='\033[0;32m'
	YELLOW='\033[1;33m'
	NC='\033[0m'

	# -- count the totals for the baseline
	if [[ $score == 'Yes' ]]; then
		if [[ $server == 'Server1' ]]; then
			score_server1_total=$((score_server1_total+1))
		fi
		if [[ $server == 'Server1' || $server == 'Server2' ]]; then
			score_server2_total=$((score_server2_total+1))
		fi
		if [[ $workstation == 'Workstation1' ]]; then
			score_workstation1_total=$((score_workstation1_total+1))
		fi
		if [[ $workstation == 'Workstation1' || $workstation == 'Workstation2' ]]; then
			score_workstation2_total=$((score_workstation2_total+1))
		fi
	else
		if [[ $server == 'Server1' ]]; then
			noscore_server1_total=$((noscore_server1_total+1))
		fi
		if [[ $server == 'Server1' || $server == 'Server2' ]]; then
			noscore_server2_total=$((noscore_server2_total+1))
		fi
		if [[ $workstation == 'Workstation1' ]]; then
			noscore_workstation1_total=$((noscore_workstation1_total+1))
		fi
		if [[ $workstation == 'Workstation1' || $workstation == 'Workstation2' ]]; then
			noscore_workstation2_total=$((noscore_workstation2_total+1))
		fi
	fi

	if [[ -f ./test/${ref}.sh ]]; then
		bash ./test/${ref}.sh ${args} > /dev/null 2>/dev/null
		if [[ "$?" -eq 0 ]]; then
			echo -e "${GREEN}PASS${NC} - $ref - ${msg}"
			
			# -- count the success for the baseline
			if [[ $score == 'Yes' ]]; then
				if [[ $server == 'Server1' ]]; then
					score_server1_ok=$((score_server1_ok+1))
				fi
				if [[ $server == 'Server1' || $server == 'Server2' ]]; then
					score_server2_ok=$((score_server2_ok+1))
				fi
				if [[ $workstation == 'Workstation1' ]]; then
					score_workstation1_ok=$((score_workstation1_ok+1))
				fi
				if [[ $workstation == 'Workstation1' || $workstation == 'Workstation2' ]]; then
					score_workstation2_ok=$((score_workstation2_ok+1))
				fi
			else
				if [[ $server == 'Server1' ]]; then
					noscore_server1_ok=$((noscore_server1_ok+1))
				fi
				if [[ $server == 'Server1' || $server == 'Server2' ]]; then
					noscore_server2_ok=$((noscore_server2_ok+1))
				fi
				if [[ $workstation == 'Workstation1' ]]; then
					noscore_workstation1_ok=$((noscore_workstation1_ok+1))
				fi
				if [[ $workstation == 'Workstation1' || $workstation == 'Workstation2' ]]; then
					noscore_workstation2_ok=$((noscore_workstation2_ok+1))
				fi
			fi
		else
			echo -e "${RED}FAIL${NC} - $ref - ${msg}"
		fi
	else
		echo -e "${YELLOW}SKIP${NC} - $ref - ${msg}"
	fi
}

if [[ $(whoami) != "root" ]]; then
        echo "You must run this script as root"
        exit 1
fi

echo "CIS CentOS Linux 7 Benchmark (v3.1.2)"
echo
echo hostname : `hostname`
echo time     : `date`
echo =================================================================================
test_wrapper 1.1.1.1 "Ensure mounting of cramfs filesystems is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.1.2 "Ensure mounting of squashfs filesystems is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.1.3 "Ensure mounting of udf filesystems is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.2 "Ensure /tmp is configured (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.3 "Ensure noexec option set on /tmp partition (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.4 "Ensure nodev option set on /tmp partition (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.5 "Ensure nosuid option set on /tmp partition (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.6 "Ensure /dev/shm is configured (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.7 "Ensure noexec option set on /dev/shm partition (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.8 "Ensure nodev option set on /dev/shm partition (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.9 "Ensure nosuid option set on /dev/shm partition (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.10 "Ensure separate partition exists for /var (Automated)" Yes Server2 Workstation2
test_wrapper 1.1.11 "Ensure separate partition exists for /var/tmp (Automated)" Yes Server2 Workstation2
test_wrapper 1.1.12 "Ensure /var/tmp partition includes the noexec option (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.13 "Ensure /var/tmp partition includes the nodev option (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.14 "Ensure /var/tmp partition includes the nosuid option (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.15 "Ensure separate partition exists for /var/log (Automated)" Yes Server2 Workstation2
test_wrapper 1.1.16 "Ensure separate partition exists for /var/log/audit (Automated)" Yes Server2 Workstation2
test_wrapper 1.1.17 "Ensure separate partition exists for /home (Automated)" Yes Server2 Workstation2
test_wrapper 1.1.18 "Ensure /home partition includes the nodev option (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.19 "Ensure removable media partitions include noexec option (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.20 "Ensure nodev option set on removable media partitions (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.21 "Ensure nosuid option set on removable media partitions (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.22 "Ensure sticky bit is set on all world-writable directories (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.23 "Disable Automounting (Automated)" Yes Server1 Workstation2
test_wrapper 1.1.24 "Disable USB Storage (Automated)" Yes Server1 Workstation2
test_wrapper 1.2.1 "Ensure GPG keys are configured (Manual)" No Server1 Workstation1
test_wrapper 1.2.2 "Ensure package manager repositories are configured (Manual)" No Server1 Workstation1
test_wrapper 1.2.3 "Ensure gpgcheck is globally activated (Automated)" Yes Server1 Workstation1
test_wrapper 1.3.1 "Ensure AIDE is installed (Automated)" Yes Server1 Workstation1
test_wrapper 1.3.2 "Ensure filesystem integrity is regularly checked (Automated)" Yes Server1 Workstation1
test_wrapper 1.4.1 "Ensure bootloader password is set (Automated)" Yes Server1 Workstation1
test_wrapper 1.4.2 "Ensure permissions on bootloader config are configured (Automated)" Yes Server1 Workstation1
test_wrapper 1.4.3 "Ensure authentication required for single user mode (Automated)" Yes Server1 Workstation1
test_wrapper 1.5.1 "Ensure core dumps are restricted (Automated)" Yes Server1 Workstation1
test_wrapper 1.5.2 "Ensure XD/NX support is enabled (Automated)" Yes Server1 Workstation1
test_wrapper 1.5.3 "Ensure address space layout randomization (ASLR) is enabled (Automated)" Yes Server1 Workstation1
test_wrapper 1.5.4 "Ensure prelink is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 1.6.1.1 "Ensure SELinux is installed (Automated)" Yes Server1 Workstation1
test_wrapper 1.6.1.2 "Ensure SELinux is not disabled in bootloader configuration (Automated)" Yes Server1 Workstation1
test_wrapper 1.6.1.3 "Ensure SELinux policy is configured (Automated)" Yes Server1 Workstation1
test_wrapper 1.6.1.4 "Ensure the SELinux mode is enforcing or permissive (Automated)" Yes Server1 Workstation1
test_wrapper 1.6.1.5 "Ensure the SELinux mode is enforcing (Automated)" Yes Server2 Workstation2
test_wrapper 1.6.1.6 "Ensure no unconfined services exist (Automated)" Yes Server1 Workstation1
test_wrapper 1.6.1.7 "Ensure SETroubleshoot is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 1.6.1.8 "Ensure the MCS Translation Service (mcstrans) is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 1.7.1 "Ensure message of the day is configured properly (Automated)" Yes Server1 Workstation1
test_wrapper 1.7.2 "Ensure local login warning banner is configured properly (Automated)" Yes Server1 Workstation1
test_wrapper 1.7.3 "Ensure remote login warning banner is configured properly (Automated)" Yes Server1 Workstation1
test_wrapper 1.7.4 "Ensure permissions on /etc/motd are configured (Automated)" Yes Server1 Workstation1
test_wrapper 1.7.5 "Ensure permissions on /etc/issue are configured (Automated)" Yes Server1 Workstation1
test_wrapper 1.7.6 "Ensure permissions on /etc/issue.net are configured (Automated)" Yes Server1 Workstation1
test_wrapper 1.8.1 "Ensure GNOME Display Manager is removed (Manual)" No Server2 Workstation2
test_wrapper 1.8.2 "Ensure GDM login banner is configured (Automated)" Yes Server1 Workstation1
test_wrapper 1.8.3 "Ensure last logged in user display is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 1.8.4 "Ensure XDCMP is not enabled (Automated)" Yes Server1 Workstation1
test_wrapper 1.9 "Ensure updates, patches, and additional security software are installed (Manual)" No Server1 Workstation1
test_wrapper 2.1.1 "Ensure xinetd is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.1.1 "Ensure time synchronization is in use (Manual)" No Server1 Workstation1
test_wrapper 2.2.1.2 "Ensure chrony is configured (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.1.3 "Ensure ntp is configured (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.2 "Ensure X11 Server components are not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.3 "Ensure Avahi Server is not installed (Automated)" Yes Server1 Workstation2
test_wrapper 2.2.4 "Ensure CUPS is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.5 "Ensure DHCP Server is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.6 "Ensure LDAP server is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.7 "Ensure DNS Server is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.8 "Ensure FTP Server is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.9 "Ensure HTTP server is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.10 "Ensure IMAP and POP3 server is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.11 "Ensure Samba is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.12 "Ensure HTTP Proxy Server is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.13 "Ensure net-snmp is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.14 "Ensure NIS server is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.15 "Ensure telnet-server is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.16 "Ensure mail transfer agent is configured for local-only mode (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.17 "Ensure nfs-utils is not installed or the nfs-server service is masked (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.18 "Ensure rpcbind is not installed or the rpcbind services are masked (Automated)" Yes Server1 Workstation1
test_wrapper 2.2.19 "Ensure rsync is not installed or the rsyncd service is masked (Automated)" Yes Server1 Workstation1
test_wrapper 2.3.1 "Ensure NIS Client is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.3.2 "Ensure rsh client is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.3.3 "Ensure talk client is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.3.4 "Ensure telnet client is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.3.5 "Ensure LDAP client is not installed (Automated)" Yes Server1 Workstation1
test_wrapper 2.4 "Ensure nonessential services are removed or masked (Manual)" No Server1 Workstation1
test_wrapper 3.1.1 "Disable IPv6 (Manual)" No Server2 Workstation2
test_wrapper 3.1.2 "Ensure wireless interfaces are disabled (Automated)" Yes Server1 Workstation2
test_wrapper 3.2.1 "Ensure IP forwarding is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 3.2.2 "Ensure packet redirect sending is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 3.3.1 "Ensure source routed packets are not accepted (Automated)" Yes Server1 Workstation1
test_wrapper 3.3.2 "Ensure ICMP redirects are not accepted (Automated)" Yes Server1 Workstation1
test_wrapper 3.3.3 "Ensure secure ICMP redirects are not accepted (Automated)" Yes Server1 Workstation1
test_wrapper 3.3.4 "Ensure suspicious packets are logged (Automated)" Yes Server1 Workstation1
test_wrapper 3.3.5 "Ensure broadcast ICMP requests are ignored (Automated)" Yes Server1 Workstation1
test_wrapper 3.3.6 "Ensure bogus ICMP responses are ignored (Automated)" Yes Server1 Workstation1
test_wrapper 3.3.7 "Ensure Reverse Path Filtering is enabled (Automated)" Yes Server1 Workstation1
test_wrapper 3.3.8 "Ensure TCP SYN Cookies is enabled (Automated)" Yes Server1 Workstation1
test_wrapper 3.3.9 "Ensure IPv6 router advertisements are not accepted (Automated)" Yes Server1 Workstation1
test_wrapper 3.4.1 "Ensure DCCP is disabled (Automated)" Yes Server2 Workstation2
test_wrapper 3.4.2 "Ensure SCTP is disabled (Automated)" Yes Server2 Workstation2
test_wrapper 3.5.1.1 "Ensure firewalld is installed (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.1.2 "Ensure iptables-services not installed with firewalld (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.1.3 "Ensure nftables either not installed or masked with firewalld (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.1.4 "Ensure firewalld service enabled and running (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.1.5 "Ensure firewalld default zone is set (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.1.6 "Ensure network interfaces are assigned to appropriate zone (Manual)" No Server1 Workstation1
test_wrapper 3.5.1.7 "Ensure firewalld drops unnecessary services and ports (Manual)" No Server1 Workstation1
test_wrapper 3.5.2.1 "Ensure nftables is installed (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.2.2 "Ensure firewalld is either not installed or masked with nftables (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.2.3 "Ensure iptables-services not installed with nftables (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.2.4 "Ensure iptables are flushed with nftables (Manual)" No Server1 Workstation1
test_wrapper 3.5.2.5 "Ensure an nftables table exists (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.2.6 "Ensure nftables base chains exist (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.2.7 "Ensure nftables loopback traffic is configured (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.2.8 "Ensure nftables outbound and established connections are configured (Manual)" No Server1 Workstation1
test_wrapper 3.5.2.9 "Ensure nftables default deny firewall policy (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.2.10 "Ensure nftables service is enabled (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.2.11 "Ensure nftables rules are permanent (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.3.1.1 "Ensure iptables packages are installed (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.3.1.2 "Ensure nftables is not installed with iptables (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.3.1.3 "Ensure firewalld is either not installed or masked with iptables (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.3.2.1 "Ensure iptables loopback traffic is configured (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.3.2.2 "Ensure iptables outbound and established connections are configured (Manual)" No Server1 Workstation1
test_wrapper 3.5.3.2.3 "Ensure iptables rules exist for all open ports (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.3.2.4 "Ensure iptables default deny firewall policy (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.3.2.5 "Ensure iptables rules are saved (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.3.2.6 "Ensure iptables is enabled and running (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.3.3.1 "Ensure ip6tables loopback traffic is configured (Automated)" Yes Server1 Workstation1
test_wrapper 3.5.3.3.2 "Ensure ip6tables outbound and established connections are configured (Manual)" No Server1 Workstation1
test_wrapper 3.5.3.3.3 " Ensure ip6tables firewall rules exist for all open ports (Automated)" Yes Server1 Workstation1

echo
echo Results
echo
echo "Scored (Server)"
echo ====================================
echo Server 1 = $score_server1_ok / $score_server1_total
echo Server 2 = $score_server2_ok / $score_server2_total

echo
echo "Scored (Workstation)"
echo ====================================
echo Workstation 1 = $score_workstation1_ok / $score_workstation1_total
echo Workstation 2 = $score_workstation2_ok / $score_workstation2_total

echo
echo "Not Scored (Server)"
echo ====================================
echo Server 1 = $noscore_server1_ok / $noscore_server1_total
echo Server 2 = $noscore_server2_ok / $noscore_server2_total
echo
echo "Not Scored (Workstation)"
echo ====================================
echo Workstation 1 = $noscore_workstation1_ok / $noscore_workstation1_total
echo Workstation 2 = $noscore_workstation2_ok / $noscore_workstation2_total
