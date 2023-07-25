# get-google-creds
This is a script to automate exporting GOOGLE CREDENTIALS every time for different GCP Terraform Projects and saving a couple of minutes every day. 


Save the script to a file, let’s say export_google_credentials.sh. 

Ensure to give execute permissions to the script using the command chmod +x export_google_credentials.sh. Then, you can run the script using ./export_google_credentials.sh in the terminal. It will look for the terraform.tfvars file, extract the gcp_sa_credentials_file value from it and set it as the GOOGLE_CREDENTIALS environment variable.


NOTE: If the script doesn't export the ENV. Try Using the source command- Instead of executing the script as a separate process, you can use the source or . command to run the script in the current shell. This way, any environment variable modifications made by the script will take effect in your current session.

Usage:  ./get_creds.sh  <file-path> 



