#!/bin/sh
# ** AUTO GENERATED **

# 5.4.5 - Ensure default user shell timeout is 900 seconds or less (Scored)

if [[ $TMOUT -eq "" || $TMOUT -gt 900 ]]; then
        exit 1
fi
