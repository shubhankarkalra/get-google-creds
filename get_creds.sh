#!/bin/bash

# Function to extract the GOOGLE_CREDENTIALS value from terraform.tfvars
get_google_credentials() {
    local credentials_file="$1"
    local google_credentials_file

    # Check if terraform.tfvars exists
    if [ -f "$credentials_file" ]; then
        # Extract the value for gcp_sa_credentials_file without surrounding quotes and handle leading/trailing spaces
        google_credentials_file=$(grep -E '^\s*gcp_sa_credentials_file\s*=' "$credentials_file" | sed -E 's/^\s*gcp_sa_credentials_file\s*=\s*//; s/"//g')

        # Debugging: Show the extracted value and the actual file path
        echo "Extracted value for gcp_sa_credentials_file: $google_credentials_file"
        echo "Actual file path: $google_credentials_file"

        # Check if the file exists
        if [ -f "$google_credentials_file" ]; then
            # Export the content of the JSON file to the GOOGLE_CREDENTIALS environment variable
            export GOOGLE_CREDENTIALS=$(<"$google_credentials_file")
        else
            echo "Error: $google_credentials_file not found."
            exit 1
        fi
    else
        echo "Error: $credentials_file not found."
        exit 1
    fi
}

# Check if the script was provided with the terraform.tfvars file path
if [ $# -eq 1 ]; then
    # Call the function with the provided terraform.tfvars file path
    get_google_credentials "$1"
else
    echo "Usage: $0 /path/to/terraform.tfvars"
    exit 1
fi
