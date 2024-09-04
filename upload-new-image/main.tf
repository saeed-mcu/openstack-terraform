terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

resource "openstack_images_image_v2" "cirros" {
  name             = "CirrOS-0.6.1"
  image_source_url = "https://download.cirros-cloud.net/0.6.1/cirros-0.6.1-x86_64-disk.img"
  container_format = "bare"
  disk_format      = "qcow2"
  min_disk_gb      = 1
  min_ram_mb       = 1
  visibility       = "public"

  properties = {
    architecture              = "x86_64"
    hypervisor_type           = "qemu"
    vm_mode                   = "hvm"
    hw_cpu_max_sockets        = "2"
    hw_cpu_max_threads        = "2"
    hw_firmware_type          = "bios"
    hw_boot_menu              = "true"
    hw_pointer_model          = "usbtablet"
    hw_scsi_model             = "virtio-scsi"
    hw_disk_bus               = "scsi"
    hw_cdrom_bus              = "scsi"
    hw_vif_model              = "virtio"
    hw_vif_multiqueue_enabled = "true"
    os_type                   = "linux"
    os_distro                 = "CirrOS"
    os_version                = "cirros0.6.1"
    os_admin_user             = "root"
  }
}
