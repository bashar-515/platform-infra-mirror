terraform {
  cloud {
    organization = "Platform-515"
    hostname = "app.terraform.io"

    workspaces {
      name = "site-staging"
    }
  }
}
