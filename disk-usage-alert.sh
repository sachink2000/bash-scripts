# Create a script to monitor a server's disk usage. If usage exceeds 80%, log the details in a file and send an alert email.

#!/bin/bash

# Define the email variables
email="your_email@example.com"
subject="Disk Usage Alert"
log_file="/path/to/logfile.log"

# Get the current disk usage as a percentage
disk_usage=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

# Check if the disk usage exceeds 80%
if [ "$disk_usage" -gt 80 ]; then
  # Log the details in a log file
  echo "$(date): Disk usage is at ${disk_usage}%" >> "$log_file"
  
  # Send an alert email
  mail -s "$subject" "$email" <<EOF
Disk usage on the server has exceeded 80%.
Current usage is at ${disk_usage}%.
Details have been logged in $log_file.
EOF
fi
