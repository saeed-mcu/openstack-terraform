terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

data "openstack_identity_project_v3" "project" {
  name = var.project_name
}

data "openstack_images_image_v2" "image" {
  name        = var.image_name
  most_recent = true
}

resource "openstack_blockstorage_volume_v3" "block_vol" {
  name     = var.volume_name
  image_id = data.openstack_images_image_v2.image.id
  size     = data.openstack_compute_flavor_v2.flavor.disk
}

data "openstack_compute_flavor_v2" "flavor" {
  name = var.flavor_name
}

data "openstack_networking_network_v2" "network" {
  name = var.network_name
}

data "openstack_networking_secgroup_v2" "default_secgroup" {
  name      = var.secgroup_name
  tenant_id = data.openstack_identity_project_v3.project.id
}

resource "openstack_compute_keypair_v2" "keypair" {
  name       = var.keypair["key1"].name
  public_key = file(var.keypair["key1"].path)
}

# Instance boot From volume
resource "openstack_compute_instance_v2" "vm_instance" {
  name            = var.instance_name
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = [data.openstack_networking_secgroup_v2.default_secgroup.name]

  network {
    uuid = data.openstack_networking_network_v2.network.id
  }

  block_device {
    uuid                  = openstack_blockstorage_volume_v3.block_vol.id
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
  }

  # Optional: Add metadata
  metadata = {
    "Purpose" = "Test Instance"
  }
}
