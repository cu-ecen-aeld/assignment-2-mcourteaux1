#!/bin/bash

# Variables
writefile='/tmp/aesd/assignment2/test.txt'
writestr='Assignment 2 Testing'

# Ensure the directory exists
mkdir -p $(dirname "$writefile")

# Call the writer C program instead of writer.sh
./finder-app/writer "$writefile" "$writestr"

# Check if the file was created successfully
if [ ! -f "$writefile" ]; then
    echo "Error: File not created!"
    exit 1
fi

# Verify content
readstr=$(cat "$writefile")
if [ "$readstr" = "$writestr" ]; then
    echo "success"
else
    echo "Error: File content mismatch!"
    exit 1
fi
