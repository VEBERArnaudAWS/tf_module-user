variable "bypass" {
  type = bool
}

variable "name" {
  type = string
}

variable "encoded_pgp_public_key" {
  type = string
}

variable "with_console_access" {
  type = bool

  default = false
}

variable "with_programmatic_access" {
  type = bool

  default = false
}

variable "ssh_key" {
  type = string

  default = ""
}
