terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.18.0"
    }
  }
}
 
provider "google" {
# Credentials only needs to be set if you do not have the GOOGLE_APPLICATION_CREDENTIALS set
  credentials = "./my-creds.json"
  project = "corded-aquifer-448117-p6"
  region  = "eu-central1"
}



resource "google_storage_bucket" "data-lake-bucket" {
  name          = "corded-aquifer-448117-p6-terra-bucket"
  location      = "EU"

  # Optional, but recommended settings:
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled     = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30  // days
    }
  }

  force_destroy = true
}


resource "google_bigquery_dataset" "dataset" {
  dataset_id = "terraform_bigquery_dataset"
  project    = "corded-aquifer-448117-p6"
  location   = "EU"
}
