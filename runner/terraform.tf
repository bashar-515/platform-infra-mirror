terraform {
  required_version = ">= 1.10.7"

  required_providers {
    oci = {
      source = "oracle/oci"
      version = "7.28.0"
    }
  }

  cloud {
    organization = "Platform-01"
    hostname = "app.terraform.io"

    workspaces {
      name = "runner"
    }
  }
}
