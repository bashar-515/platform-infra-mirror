resource "tfe_organization" "platform" {
  name = "Platform-515"
  email = var.email
}

resource "tfe_organization_token" "platform" {
  organization = tfe_organization.platform.name
}
