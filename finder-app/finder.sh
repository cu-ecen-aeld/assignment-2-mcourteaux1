#!/bin/bash

# Check if the correct number of arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Missing parameters."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Assign the arguments to variables
filesdir=$1
searchstr=$2

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory."
    exit 1
fi

# Count the number of files in the directory and subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines containing the searchstr
num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the results
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"
