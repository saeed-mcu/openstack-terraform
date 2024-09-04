output "network_details" {
  description = "Network Details"
  value = format("ID: %s , Name:%s , Subnet:%v",
    data.openstack_networking_network_v2.network.id,
    data.openstack_networking_network_v2.network.name,
  data.openstack_networking_network_v2.network.subnets)
}
