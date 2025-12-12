terraform {
  cloud {
    organization = "Platform-515"
    hostname = "app.terraform.io"

    workspaces {
      name = "ci-state" # TODO(bashar-515): migrate remote backend
    }
  }
}
