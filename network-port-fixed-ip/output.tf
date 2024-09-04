output "network_details" {
  description = "Network Details"
  value = data.openstack_networking_network_v2.network
  #value = format("ID: %s , Name:%s , Subnet:%v",
  #  data.openstack_networking_network_v2.network.id,
  #  data.openstack_networking_network_v2.network.name,
  #data.openstack_networking_network_v2.network.subnets)
}

#output "subnet_details" {
#  description = "Subnet Details"
#  value       = data.openstack_networking_subnet_ids_v2.subnets
#  #  value = [for sbnt in data.openstack_networking_subnet_ids_v2.subnets :
#  #    format("ID: %s , Name: , Subnet", sbnt.id)
#  #  ]
#}

output "subnet_details" {
  description = "Subnet Details"
  value       = data.openstack_networking_subnet_v2.subnet
  #  value = [for sbnt in data.openstack_networking_subnet_ids_v2.subnets :
  #    format("ID: %s , Name: , Subnet", sbnt.id)
  #  ]
}
