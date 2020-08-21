variable "project" {
  description = "GCP project name"
}

variable "credentials_file" {
  description = "Reference to GCP service account key with editor role"
}

variable "bucket_name" {
  type        = string
  description = "Your GCS bucket"
}

variable "bucket_content" {
  type        = string
  description = "Reference to content to be placed inside the bucket"
}

variable "region" {
  default = "us-central1"
}

variable "location" {
  description = "bucket location"
  default     = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}


