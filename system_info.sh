#!/bin/bash

# Script Name:                  system_info.sh
# Author:                       Justin Patterson
# Date of latest revision:      12/09/2023
# Purpose:                      Display system information using lshw


# Function to display component information
display_component_info() {
    echo "=== $1 ==="
    lshw -c "$1" | grep -E 'description|product|vendor|physical id|bus info|width|clock|capabilities|configuration|resources' | sed 's/^[[:space:]]*//'
    echo
}

# Check if the script is running as root
[ "$EUID" -ne 0 ] && { echo "Please run as root (use sudo or execute as root)."; exit 1; }

# Display information for each component
display_component_info "computer"
display_component_info "cpu"
display_component_info "memory"
display_component_info "display"
display_component_info "network"

