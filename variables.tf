# Declare variable

variable "zone_dns" {
    type = string
}

variable "post_install" {
    type = list(string)
}

variable "ssh_private_key" {
    type = string
}
