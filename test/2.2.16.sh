#!/bin/sh
# ** AUTO GENERATED **

# 2.2.16 - Ensure mail transfer agent is configured for local-only mode (Automated) - Server1 Workstation1

out="$(ss -lntu | grep -E ':25\s' | grep -E -v '\s(127.0.0.1|\[?::1\]?):25\s')"
[[ -z "${out}" ]] || exit $?
