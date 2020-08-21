provider "google" {
  version     = "3.33"
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region
  zone        = var.zone
}

provider "null" {
  version = "~> 2.1"
}

resource "google_storage_bucket" "website" {
  provider      = google
  name          = var.bucket_name
  location      = var.location
  force_destroy = true
}

resource "null_resource" "upload_folder_content" {
  provisioner "local-exec" {
    command = "gsutil cp -r ${var.bucket_content} gs://${var.bucket_name}"
  }
}

resource "google_storage_bucket_iam_binding" "binding" {
  bucket  = google_storage_bucket.website.name
  role    = "roles/storage.objectViewer"
  members = ["allUsers"]
}

// Load Balancer resources
resource "google_compute_backend_bucket" "website" {
  name        = "website-backend"
  description = "Contains files needed by the website"
  bucket_name = google_storage_bucket.website.name
  enable_cdn  = true
}

resource "google_compute_url_map" "website" {
  provider        = google
  name            = "website-url-map"
  default_service = google_compute_backend_bucket.website.self_link
}

resource "google_compute_target_http_proxy" "website" {
  name    = "website-target-proxy"
  url_map = google_compute_url_map.website.self_link
}

# GCP forwarding rule
resource "google_compute_global_forwarding_rule" "default" {
  name                  = "website-forwarding-rule"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.website.self_link
}
