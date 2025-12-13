terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "7.28.0"
    }
  }

  cloud {
    organization = "Nexus-515"
    hostname = "app.terraform.io"

    workspaces {
      name = "runner"
    }
  }
}
