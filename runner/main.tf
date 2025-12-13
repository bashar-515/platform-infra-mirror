resource "oci_identity_compartment" "platform" {
  compartment_id = var.tenancy_ocid
  description = "Houses resources that are not specific to a single project or app."
  name = "Platform"
}

resource "oci_identity_compartment" "runner" {
  compartment_id = oci_identity_compartment.platform.id
  description = "Houses resources for my universal Codeberg CI runner."
  name = "Runner"
}
