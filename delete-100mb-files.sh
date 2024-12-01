# Create a script that monitors a specified directory and automatically deletes any files larger than 100 MB.

#!/bin/bash

# Define the directory to monitor
directory="/path/to/your/directory"

# Find and delete files larger than 100 MB
find "$directory" -type f -size +100M -exec rm -f {} \;

# Print a message when done
echo "Files larger than 100 MB have been deleted from $directory"
