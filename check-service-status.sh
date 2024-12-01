# Create a script that checks if a particular service (e.g., httpd or nginx) is running. If not, it should restart the service and log the action.

#!/bin/bash

# Define the service name
service_name="httpd"  # Change to "nginx" if needed

# Define the log file
log_file="/path/to/service_monitor.log"

# Check if the service is running
if ! systemctl is-active --quiet "$service_name"; then
  # Service is not running, restart it
  systemctl restart "$service_name"
  
  # Log the action
  echo "$(date): $service_name was not running and has been restarted." >> "$log_file"
  
  # Optional: Send an alert email
  email="your_email@example.com"
  subject="Service Alert: $service_name Restarted"
  mail -s "$subject" "$email" <<EOF
The $service_name service was not running and has been restarted.
Action logged in $log_file.
EOF
fi
