This folder has terraform script to create an google compute instance with firewall to allow it serve contents through nginx

## Create `terraform.tfvars`

Create `terraform.tfvars` file defining at lest the below variables.
For all variables check `variables.tf` file.

```
project = "gcp-project-id"
credentials_file = "Reference to GCP service account key with editor role"
```

## Available Scripts

1. Initialize terraform with `terraform init`
2. Apply changes with `terraform apply`

External IP address of the compute instance is printed on console after successful run of the script.
