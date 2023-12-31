#!/bin/bash

# Script Name:                  Print Login History
# Author:                       Justin Patterson
# Date of latest revision:      11/11/2023
# Purpose:                      Print the login history of users on this computer

# Declaration of variables

# Declaration of functions
print_login_history() {
    if [ -f /var/log/auth.log ]; then
        echo "This is the login history:"
        grep 'sshd' /var/log/auth.log | sed 's/^/  /'
    else
        echo "Auth log file not found. Make sure you are running this on your system."
    fi
}

print_history_multiple_times() {
    echo "Calling the print_login_history function 3 times:"
    print_login_history
    print_login_history
    print_login_history
}

print_user_history() {
    if [ -n "$1" ]; then
        echo "Login history for user $1:"
        grep "$1" /var/log/auth.log | grep 'sshd' | sed 's/^/  /'
    else
        echo "Please provide a username as an argument."
    fi
}

# Main
print_history_multiple_times
print_user_history "your_username"

# End