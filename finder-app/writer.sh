#!/bin/bash

# Check if correct number of arguments is passed
if [ "$#" -ne 2 ]; then
    echo "Error: Both arguments (file path and string) must be provided."
    exit 1
fi

# Assign arguments to variables
writefile=$1
writestr=$2

# Create the directory path if it doesn't exist
dirpath=$(dirname "$writefile")
if [ ! -d "$dirpath" ]; then
    echo "Creating directory path: $dirpath"
    mkdir -p "$dirpath" || { echo "Error: Failed to create directory $dirpath"; exit 1; }
fi

# Write the string to the file, overwriting if it exists
echo "$writestr" > "$writefile" || { echo "Error: Could not write to $writefile"; exit 1; }

echo "Successfully wrote to $writefile"

