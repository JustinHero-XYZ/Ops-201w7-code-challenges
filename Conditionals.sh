#!/bin/bash

# Script Name:                  File or Directory Creation Script
# Author:                       Justin Patterson
# Date of latest revision:      11/22/2023
# Purpose:                      Detects if a file or directory exists, then creates it if it does not exist.

# Declaration of variables
paths=("/path/to/file.txt" "/path/to/directory")

# Declaration of functions
create_path() {
    local path=$1

    if [ -e "$path" ]; then
        echo "The path $path already exists."
    else
        if [ -d "$path" ]; then
            mkdir "$path"
            echo "Directory $path created."
        elif [ -f "$path" ]; then
            touch "$path"
            echo "File $path created."
        else
            echo "Invalid path: $path"
        fi
    fi
}

# Main
for path in "${paths[@]}"; do
    create_path "$path"
done

# End
