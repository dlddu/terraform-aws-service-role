variable "service_identifier" {
  type = string
}

variable "role_name" {
  type = string
}

variable "inline_policy" {
  type    = list(string)
  default = null
}
