resource "oci_identity_compartment" "nexus" {
  compartment_id = var.tenancy_ocid
  description = "Houses resources that are not specific to a single project or app."
  name = "Nexus"
}

resource "oci_identity_compartment" "runner" {
  compartment_id = oci_identity_compartment.nexus.id
  description = "Houses resources for my universal Codeberg CI runner."
  name = "Runner"
}
