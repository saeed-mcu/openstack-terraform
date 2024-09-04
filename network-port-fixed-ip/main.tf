terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

data "openstack_networking_network_v2" "network" {
  name = var.network_name
}

data "openstack_networking_subnet_v2" "subnet" {
  network_id = data.openstack_networking_network_v2.network.id
  cidr = var.subnet_cidr
}

resource "openstack_networking_port_v2" "port" {
  name           = var.port_name
  network_id     = data.openstack_networking_network_v2.network.id
  admin_state_up = "true"

  fixed_ip {
    subnet_id = data.openstack_networking_subnet_v2.subnet.id
    ip_address = var.ip_address
  }
}