#!/bin/bash

# Ask for the route
read -p "Enter the route to test (e.g., /version): " route

# Ask for the number of requests to perform
read -p "Enter the number of requests to perform: " num_requests

# Set the base URL
base_url="http://192.168.49.2:32032"

# Record the start time
start_time=$(date +%s%3N)

# Perform the requests using curl and display progress percentage as a dynamic output
for ((i=1; i<=num_requests; i++))
do
    curl -s -o /dev/null "$base_url$route"
    
    # Calculate percentage progress
    percent=$(( (i * 100) / num_requests ))
    
    # Update the progress bar dynamically (single line)
    printf "\rProgress: [%-50s] %3d%%" $(printf "%0.s#" $(seq 1 $((percent / 2)))) $percent
done

# Record the end time
end_time=$(date +%s%3N)

# Calculate the total time taken
total_time=$((end_time - start_time))

# Output the result
echo -e "\n$num_requests requests have been sent successfully."
echo "Total time taken: $((total_time / 1000)) seconds and $((total_time % 1000)) milliseconds."
