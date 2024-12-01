# Write a shell script to find and delete all files in a directory older than 30 days.

#!/bin/bash

# Define the directory to search
directory="/path/to/your/directory"

# Find and delete files older than 30 days
find "$directory" -type f -mtime +30 -exec rm -f {} \;

# Print a message when done
echo "Files older than 30 days have been deleted from $directory"
