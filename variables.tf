variable "bypass" {
  type = "string"

  default = false
}

variable "name" {
  type = "string"
}

variable "with_console_access" {
  type = "string"

  default = false
}

variable "with_programmatic_access" {
  type = "string"

  default = false
}

variable "encoded_pgp_public_key" {
  type = "string"
}

variable "ssh_key" {
  type = "string"

  default = ""
}
