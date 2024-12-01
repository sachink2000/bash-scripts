# Create a script to check the availability of a list of websites. For each site, if it's unreachable, log the URL and send an alert.

#!/bin/bash

# Define the list of websites
websites=("https://example.com" "https://another-example.com" "https://yet-another-example.com")

# Define the log file
log_file="/path/to/unreachable_sites.log"

# Define email variables
email="your_email@example.com"
subject="Website Availability Alert"

# Function to check website availability
check_website() {
  url=$1
  if ! curl -Is "$url" | head -n 1 | grep "200\|301"; then
    # Log the unreachable URL
    echo "$(date): $url is unreachable" >> "$log_file"
    
    # Send an alert email
    mail -s "$subject" "$email" <<EOF
The website $url is currently unreachable.
Details have been logged in $log_file.
EOF
  fi
}

# Loop through the list of websites and check each one
for site in "${websites[@]}"; do
  check_website "$site"
done

# Print a message when done
echo "Website availability check completed."
