resource "tfe_organization" "platform" {
  name = "Platform"
  email = var.email
}

resource "tfe_organization_token" "platform" {
  organization = tfe_organization.platform.name
}
