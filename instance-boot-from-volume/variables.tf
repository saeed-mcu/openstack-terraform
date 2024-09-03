variable "project_name" {
  type    = string
  default = "admin"
}

variable "volume_name" {
  type    = string
  default = "myvol"
}

variable "flavor_name" {
  type    = string
  default = "m1.micro"
}

variable "image_name" {
  type    = string
  default = "Ubuntu 24.04"
}

variable "network_name" {
  type    = string
  default = "public-network"
}

variable "secgroup_name" {
  type    = string
  default = "default"
}

variable "keypair" {
  default = {
    key1 = {
      name = "meykey"
      path = "~/.ssh/id_ed25519.pub"
    }
  }
}
variable "instance_name" {
  type    = string
  default = "my-tf-vm"
}
