# Write a script that renames all .txt files in a directory by appending the current date to the filename.

#!/bin/bash

# Define the directory containing the .txt files
directory="/path/to/your/directory"

# Get the current date in YYYY-MM-DD format
current_date=$(date +"%Y-%m-%d")

# Loop through all .txt files in the directory
for file in "$directory"/*.txt; do
  # Get the base name of the file (without the directory path)
  base_name=$(basename "$file" .txt)
  
  # Construct the new file name by appending the date
  new_name="${base_name}_${current_date}.txt"
  
  # Rename the file
  mv "$file" "$directory/$new_name"
done

# Print a message when done
echo "All .txt files in $directory have been renamed by appending the current date."
