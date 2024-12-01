# Write a script that performs a backup of a specified directory and compresses it with the current date in the filename. Schedule it to run daily using cron.

#!/bin/bash

# Specify the directory to backup
source_directory="/path/to/your/directory"

# Specify the backup directory
backup_directory="/path/to/backup/directory"

# Get the current date in YYYY-MM-DD format
current_date=$(date +"%Y-%m-%d")

# Create a backup filename with the current date
backup_filename="backup_${current_date}.tar.gz"

# Perform the backup and compress it
tar -czvf "$backup_directory/$backup_filename" "$source_directory"

# Print a message when done
echo "Backup of $source_directory completed and saved as $backup_filename"
