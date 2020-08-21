This folder has terraform script to create a cloud storage bucket and serve static content using `cloud load balancer` with `cloud CDN`.

## Create `terraform.tfvars`

Create `terraform.tfvars` file defining at lest the below variables.
For all variables check `variables.tf` file.

```
project = "gcp-project-id"
credentials_file = "Reference to GCP service account key with editor role"
bucket_name    = "globally unique bucket name"
bucket_content = "reference to content folder/*"
```

## Available Scripts

1. Initialize terraform with `terraform init`
2. Apply changes with `terraform apply`

External IP address of the load balancer is printed on console after successful run of the script.
