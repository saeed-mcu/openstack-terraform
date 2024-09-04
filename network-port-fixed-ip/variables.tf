variable "network_name" {
  type    = string
  default = "public-network"
}

variable "port_name" {
  type    = string
  default = "myprot"
}

variable "subnet_cidr" {
  type    = string
  default = "20.1.3.0/24"
}

variable "ip_address" {
  type    = string
  default = "20.1.3.6"
}
