variable "credentials" {
  description = "My Credentials"
  default     = "/workspaces/DataEngineeringBootcamp2025/01-docker-terraform/1_terraform_gcp/keys/my-creds.json"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}

 
variable "project" {
  description = "My first GCP Project"
  default     = "corded-aquifer-448117-p6"
} 

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default = "eu-west1"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default = "EU"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  #Update the below to what you want your dataset to be called
  default = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  #Update the below to a unique bucket name
  default = "terraform-demo-terra-bucket_07"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}