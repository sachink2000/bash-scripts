# Write a script to monitor CPU and memory usage every minute and log the details if CPU usage is above 90% or memory usage exceeds 75%.

#!/bin/bash

# Define the log file
log_file="/path/to/cpu_mem_usage.log"

# Infinite loop to monitor every minute
while true; do
  # Get the current CPU usage
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
  
  # Get the current memory usage
  mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
  
  # Check if CPU usage is above 90%
  if (( $(echo "$cpu_usage > 90" | bc -l) )); then
    echo "$(date): High CPU usage detected - ${cpu_usage}%" >> "$log_file"
  fi
  
  # Check if memory usage is above 75%
  if (( $(echo "$mem_usage > 75" | bc -l) )); then
    echo "$(date): High memory usage detected - ${mem_usage}%" >> "$log_file"
  fi

  # Wait for 1 minute before checking again
  sleep 60
done
