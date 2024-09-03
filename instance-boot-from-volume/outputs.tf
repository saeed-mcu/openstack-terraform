output "instance_name" {
  value = openstack_compute_instance_v2.vm_instance.name
}

output "instance_ip" {
  value = openstack_compute_instance_v2.vm_instance.access_ip_v4
}
