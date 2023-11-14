#!/bin/bash

# Script Name: Create Directories and Files
# Author: Justin Patterson
# Date of latest revision: 11/14/2023
# Purpose: Create four directories and a .txt file in each directory

# Declaration of variables
directories=("dir1" "dir2" "dir3" "dir4")

# Main
echo "Creating directories and files..."
for dir in "${directories[@]}"; do
    mkdir -p "$dir" && echo "Directory $dir created."
    touch "$dir/file.txt" && echo "File.txt created in $dir."
done

# End

