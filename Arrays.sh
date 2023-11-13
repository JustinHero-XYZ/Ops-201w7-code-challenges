#!/bin/bash

# Script Name:                  Create Directories and Files
# Author:                       Your Name
# Date of latest revision:      00/00/0000
# Purpose:                      Create four directories and a .txt file in each directory

# Declaration of variables
directories=("dir1" "dir2" "dir3" "dir4")

# Declaration of functions

# Main
echo "Creating directories..."
for dir in "${directories[@]}"; do
    mkdir "$dir"
    echo "Directory $dir created."
done

echo "Putting directory names into an array..."

# Reference the array variable to create a new .txt file in each directory
for dir in "${directories[@]}"; do
    touch "$dir/file.txt"
    echo "File.txt created in $dir."
done

# End

