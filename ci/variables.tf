variable "tenancy_ocid" {
  type = string
  description = "Tenancy's OCID"
}

variable "user_ocid" {
  type = string
  description = "User's OCID"
  default = ""
}

variable "fingerprint" {
  type = string
  description = "Key Fingerprint"
  default     = ""
}

variable "private_key_path" {
  type = string
  description = "The private key path to pem."
  default     = ""
}

variable "region" {
  type = string
  description = "OCI Region"
}

variable "ssh_authorized_keys_path" {
  type = string
  description = "Public SSH keys path to be included in the ~/.ssh/authorized_keys file for the default user on the instance."
  default     = ""
}

variable "ssh_private_key_path" {
  type = string
  description = "The private key path to access instance."
  default     = ""
}
