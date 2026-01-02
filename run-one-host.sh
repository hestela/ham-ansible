#!/bin/bash

# Check if correct number of arguments are passed
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <hostname> <role_name> <callsign>"
    exit 1
fi
TMP=$(mktemp)

HOSTNAME=$1
ROLE_NAME=$2
CALLSIGN=$3

echo "[$ROLE_NAME]" > "$TMP"
echo "$HOSTNAME" >> "$TMP"


# Run ansible-playbook with the provided role and extra vars
ansible-playbook "$ROLE_NAME".yml --ask-become-pass -e "callsign=$CALLSIGN" -i "$TMP"
rm "$TMP"
