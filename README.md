# Platform Infrastructure

/ci was created using these tutorials:
1. [https://learn.arm.com/learning-paths/servers-and-cloud-computing/oci-terraform/tf-oci/](https://learn.arm.com/learning-paths/servers-and-cloud-computing/oci-terraform/tf-oci/)
2. [https://docs.oracle.com/en-us/iaas/Content/dev/terraform/tutorials/tf-compute.htm](https://docs.oracle.com/en-us/iaas/Content/dev/terraform/tutorials/tf-compute.htm)

## Bootstrap

1. Create a user API token in the the [UI](app.terraform.io). The resulting token value should be stored in an environment variable `TFE_TOKEN`.
2. Store your email in an environment variable `TF_VAR_email`
3. `tofu apply` creates an organization named "Platform" and a token to access it. Replace `TFE_TOKEN` with said token, retrievable with `tofu output -raw organization_token`

## CI
