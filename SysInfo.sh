#!/bin/bash

# Script Name:                  system_info.sh
# Author:                       Justin Patterson
# Date of latest revision:      11/24/2023
# Purpose:                      Display system information using lshw

# Declaration of variables

# Declaration of functions

# Function to display information about a specific component
display_component_info() {
    component_name=$1
    echo "------------------------"
    echo " $component_name Information"
    echo "------------------------"
    lshw -c $component_name | grep -E 'product|vendor|physical id|bus info|width|description|size|clock|capabilities|configuration|resources' | sed 's/^\s*//'
    echo ""
}

# Main

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (sudo)."
    exit
fi

# Display information about each component
display_component_info "computer"
display_component_info "cpu"
display_component_info "memory"
display_component_info "display"
display_component_info "network"
display_component_info "bios"

# End
