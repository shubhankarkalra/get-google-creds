# get-google-creds
This is a script to automate exporting GOOGLE CREDENTIALS every time for different GCP Terraform Projects and saving a couple of minutes every day. 


Save the script to a file, let’s say export_google_credentials.sh. Ensure to give execute permissions to the script using the command chmod +x export_google_credentials.sh. Then, you can run the script using ./export_google_credentials.sh in the terminal. It will look for the terraform.tfvars file, extract the gcp_sa_credentials_file value from it and set it as the GOOGLE_CREDENTIALS environment variable.


NOTE: If your config file name is other than "terraform.tfvars" you can change the same in Line 22 of script to your input file name. 
