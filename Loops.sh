#!/bin/bash

# Script Name: Process Manager
# Author: Justin Patterson
# Date of latest revision: 11/12/2023
# Purpose: Display running processes, allow the user to kill a process by PID.

while true; do
    # Display running processes
    echo -e "\nRunning Processes:"
    ps aux

    # Ask the user for a PID
    read -p $'\nEnter the PID of the process to kill (or press Ctrl + C to exit): ' pid_to_kill

    # Kill the process and display the result
    if kill -9 $pid_to_kill 2>/dev/null; then
        echo "Process with PID $pid_to_kill killed successfully."
    else
        echo "Failed to kill process with PID $pid_to_kill. Please check the PID."
    fi
done
