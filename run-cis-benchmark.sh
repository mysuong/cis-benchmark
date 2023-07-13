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

echo "CIS CentOS Linux 7 Benchmark (v3.1.2 - 08-31-2021)"
echo
echo hostname : `hostname`
echo time     : `date`
echo =================================================================================
test_wrapper 1.1.1.1 "Ensure mounting of cramfs filesystems is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 1.1.1.2 "Ensure mounting of squashfs filesystems is disabled (Automated)" Yes Server2 Workstation2
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
# test_wrapper 3.5.2.10 "Ensure nftables service is enabled (Automated)" Yes Server1 Workstation1
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
test_wrapper 4.1.1.1 "Ensure auditd is installed (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.1.2 "Ensure auditd service is enabled and running (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.1.3 "Ensure auditing for processes that start prior to auditd is enabled (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.2.1 "Ensure audit log storage size is configured (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.2.2 "Ensure audit logs are not automatically deleted (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.2.3 "Ensure system is disabled when audit logs are full (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.2.4 "Ensure audit_backlog_limit is sufficient (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.3 "Ensure events that modify date and time information are collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.4 "Ensure events that modify user/group information are collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.5 "Ensure events that modify the system's network environment are collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.6 "Ensure events that modify the system's Mandatory Access Controls are collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.7 "Ensure login and logout events are collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.8 "Ensure session initiation information is collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.9 "Ensure discretionary access control permission modification events are collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.10 "Ensure unsuccessful unauthorized file access attempts are collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.11 "Ensure use of privileged commands is collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.12 "Ensure successful file system mounts are collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.13 "Ensure file deletion events by users are collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.14 "Ensure changes to system administration scope (sudoers) is collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.15 "Ensure system administrator command executions (sudo) are collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.16 "Ensure kernel module loading and unloading is collected (Automated)" Yes Server2 Workstation2
test_wrapper 4.1.17 "Ensure the audit configuration is immutable (Automated)" Yes Server2 Workstation2
test_wrapper 4.2.1.1 "Ensure rsyslog is installed (Automated)" Yes Server1 Workstation1
test_wrapper 4.2.1.2 "Ensure rsyslog Service is enabled and running (Automated)" Yes Server1 Workstation1
test_wrapper 4.2.1.3 "Ensure rsyslog default file permissions configured (Automated)" Yes Server1 Workstation1
test_wrapper 4.2.1.4 "Ensure logging is configured (Manual)" No Server1 Workstation1
test_wrapper 4.2.1.5 "Ensure rsyslog is configured to send logs to a remote log host (Automated)" Yes Server1 Workstation1
test_wrapper 4.2.1.6 "Ensure remote rsyslog messages are only accepted on designated log hosts. (Manual)" No Server1 Workstation1
test_wrapper 4.2.2.1 "Ensure journald is configured to send logs to rsyslog (Automated)" Yes Server1 Workstation1
test_wrapper 4.2.2.2 "Ensure journald is configured to compress large log files (Automated)" Yes Server1 Workstation1
test_wrapper 4.2.2.3 "Ensure journald is configured to write logfiles to persistent disk (Automated)" Yes Server1 Workstation1
test_wrapper 4.2.3 "Ensure permissions on all logfiles are configured (Manual)" No Server1 Workstation1
test_wrapper 4.2.4 "Ensure logrotate is configured (Manual)" No Server1 Workstation1
test_wrapper 5.1.1 "Ensure cron daemon is enabled and running (Automated)" Yes Server1 Workstation1
test_wrapper 5.1.2 "Ensure permissions on /etc/crontab are configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.1.3 "Ensure permissions on /etc/cron.hourly are configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.1.4 "Ensure permissions on /etc/cron.daily are configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.1.5 "Ensure permissions on /etc/cron.weekly are configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.1.6 "Ensure permissions on /etc/cron.monthly are configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.1.7 "Ensure permissions on /etc/cron.d are configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.1.8 "Ensure cron is restricted to authorized users (Automated)" Yes Server1 Workstation1
test_wrapper 5.1.9 "Ensure at is restricted to authorized users (Automated)" Yes Server1 Workstation1
test_wrapper 5.2.1 "Ensure sudo is installed (Automated)" Yes Server1 Workstation1
test_wrapper 5.2.2 "Ensure sudo commands use pty (Automated)" Yes Server1 Workstation1
test_wrapper 5.2.3 "Ensure sudo log file exists (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.1 "Ensure permissions on /etc/ssh/sshd_config are configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.2 "Ensure permissions on SSH private host key files are configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.3 "Ensure permissions on SSH public host key files are configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.4 "Ensure SSH access is limited (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.5 "Ensure SSH LogLevel is appropriate (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.6 "Ensure SSH X11 forwarding is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.7 "Ensure SSH MaxAuthTries is set to 4 or less (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.8 "Ensure SSH IgnoreRhosts is enabled (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.9 "Ensure SSH HostbasedAuthentication is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.10 "Ensure SSH root login is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.11 "Ensure SSH PermitEmptyPasswords is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.12 "Ensure SSH PermitUserEnvironment is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.13 "Ensure only strong Ciphers are used (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.14 "Ensure only strong MAC algorithms are used (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.15 "Ensure only strong Key Exchange algorithms are used (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.16 "Ensure SSH Idle Timeout Interval is configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.17 "Ensure SSH LoginGraceTime is set to one minute or less (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.18 "Ensure SSH warning banner is configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.19 "Ensure SSH PAM is enabled (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.20 "Ensure SSH AllowTcpForwarding is disabled (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.21 "Ensure SSH MaxStartups is configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.3.22 "Ensure SSH MaxSessions is limited (Automated)" Yes Server1 Workstation1
test_wrapper 5.4.1 "Ensure password creation requirements are configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.4.2 "Ensure lockout for failed password attempts is configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.4.3 "Ensure password hashing algorithm is SHA-512 (Automated)" Yes Server1 Workstation1
test_wrapper 5.4.4 "Ensure password reuse is limited (Automated)" Yes Server1 Workstation1
test_wrapper 5.5.1.1 "Ensure password expiration is 365 days or less (Automated)" Yes Server1 Workstation1
test_wrapper 5.5.1.2 "Ensure minimum days between password changes is configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.5.1.3 "Ensure password expiration warning days is 7 or more (Automated)" Yes Server1 Workstation1
test_wrapper 5.5.1.4 "Ensure inactive password lock is 30 days or less (Automated)" Yes Server1 Workstation1
test_wrapper 5.5.1.5 "Ensure all users last password change date is in the past (Automated)" Yes Server1 Workstation1
test_wrapper 5.5.2 "Ensure system accounts are secured (Automated)" Yes Server1 Workstation1
test_wrapper 5.5.3 "Ensure default group for the root account is GID 0 (Automated)" Yes Server1 Workstation1
test_wrapper 5.5.4 "Ensure default user shell timeout is configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.5.5 "Ensure default user umask is configured (Automated)" Yes Server1 Workstation1
test_wrapper 5.6 "Ensure root login is restricted to system console (Manual)" No Server1 Workstation1
test_wrapper 5.7 "Ensure access to the su command is restricted (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.1 "Audit system file permissions (Manual)" No Server2 Workstation2
test_wrapper 6.1.2 "Ensure permissions on /etc/passwd are configured (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.3 "Ensure permissions on /etc/passwd- are configured (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.4 "Ensure permissions on /etc/shadow are configured (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.5 "Ensure permissions on /etc/shadow- are configured (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.6 "Ensure permissions on /etc/gshadow- are configured (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.7 "Ensure permissions on /etc/gshadow are configured (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.8 "Ensure permissions on /etc/group are configured (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.9 "Ensure permissions on /etc/group- are configured (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.10 "Ensure no world writable files exist (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.11 "Ensure no unowned files or directories exist (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.12 "Ensure no ungrouped files or directories exist (Automated)" Yes Server1 Workstation1
test_wrapper 6.1.13 "Audit SUID executables (Manual)" No Server1 Workstation1
test_wrapper 6.1.14 "Audit SGID executables (Manual)" No Server1 Workstation1
test_wrapper 6.2.1 "Ensure accounts in /etc/passwd use shadowed passwords (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.2 "Ensure /etc/shadow password fields are not empty (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.3 "Ensure all groups in /etc/passwd exist in /etc/group (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.4 "Ensure shadow group is empty (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.5 "Ensure no duplicate user names exist (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.6 "Ensure no duplicate group names exist (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.7 "Ensure no duplicate UIDs exist (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.8 "Ensure no duplicate GIDs exist (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.9 "Ensure root is the only UID 0 account (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.10 "Ensure root PATH Integrity (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.11 "Ensure all users' home directories exist (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.12 "Ensure users own their home directories (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.13 "Ensure users' home directories permissions are 750 or more restrictive (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.14 "Ensure users' dot files are not group or world writable (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.15 "Ensure no users have .forward files (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.16 "Ensure no users have .netrc files (Automated)" Yes Server1 Workstation1
test_wrapper 6.2.17 "Ensure no users have .rhosts files (Automated)" Yes Server1 Workstation1

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
