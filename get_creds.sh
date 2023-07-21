#!/bin/bash

# Function to extract the GOOGLE_CREDENTIALS value from terraform.tfvars
get_google_credentials() {
    local credentials_file=$1
    local google_credentials

    # Check if terraform.tfvars exists
    if [ -f "$credentials_file" ]; then
        # Extract the GOOGLE_CREDENTIALS value from the file
        google_credentials=$(grep -oP 'gcp_sa_credentials_file\s*=\s*"\K[^"]+' "$credentials_file")

        # Export the value to the GOOGLE_CREDENTIALS environment variable
        export GOOGLE_CREDENTIALS="$(cat "$google_credentials")"
    else
        echo "Error: $credentials_file not found."
        exit 1
    fi
}

# Call the function with the provided key file name
get_google_credentials "terraform.tfvars"
