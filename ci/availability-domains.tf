# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domains

# Tenancy is the root or parent to all compartments or if you have
# created one, you can use that one in the terraform.tfvars file.

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

output "all-availability-domains-in-your-tenancy" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}
