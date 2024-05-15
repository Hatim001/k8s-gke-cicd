provider "google" {
  credentials = file("./hatim_gkey.json")
  project     = "braided-visitor-417017"
  region      = "us-central1"
}

resource "google_container_cluster" "hatim_cluster" {
  name               = "hatim-cluster"
  location           = "us-central1"
  initial_node_count = 1

  deletion_protection = false

  node_config {
    machine_type        = "e2-micro"
    disk_size_gb        = 10
    disk_type           = "pd-standard"
    image_type          = "COS_CONTAINERD"
    preemptible         = false
    oauth_scopes        = ["https://www.googleapis.com/auth/cloud-platform"]
    metadata            = {
      disable-legacy-endpoints = "true"
    }
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}
