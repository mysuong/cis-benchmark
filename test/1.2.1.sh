#!/bin/sh
# ** AUTO GENERATED **

# 1.2.1 - Ensure GPG keys are configured (Manual)

keys="$(rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n' \ | grep -Ev '(gpg-pubkey-f4a80eb5-53a7ff4b|gpg-pubkey-352c64e5-52ae6884|gpg-pubkey-621e9f35-58adea78)' || exit $?)"
[[ -z "${keys}" ]] || exit 1
