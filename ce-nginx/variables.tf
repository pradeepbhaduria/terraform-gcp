variable "project" {
  description = "GCP project name"
}

variable "credentials_file" {
  description = "Reference to GCP service account key with editor role"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}
