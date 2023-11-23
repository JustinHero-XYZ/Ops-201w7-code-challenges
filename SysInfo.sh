#!/bin/bash

# Script Name:                  system_info.sh
# Author:                       [Your Name]
# Date of latest revision:      [00/00/0000]
# Purpose:                      Display system information using lshw and dmidecode

# Declaration of variables

# Declaration of functions

# Function to display information about a specific component
display_component_info() {
    component_name=$1
    echo "------------------------"
    echo " $component_name Information"
    echo "------------------------"

    case $component_name in
        "computer" | "cpu" | "memory" | "display" | "network")
            lshw -c $component_name | grep -E 'product|vendor|physical id|bus info|width|description|size|clock|capabilities|configuration|resources'
            ;;
        "bios")
            dmidecode -t bios | grep -E 'Vendor|Version|Release Date'
            ;;
        *)
            echo "Unsupported component: $component_name"
            ;;
    esac

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
