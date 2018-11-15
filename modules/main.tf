module "linux"{
  source="Azure/compute/azurerm"
  resource_group_name="${var.rg}"
  location="${var.location}"
  admin_password="Northwest1234!"
  admin_username="azureops"
  vm_os_publisher="Canonical"
  vm_os_simple="UbuntuServer"
  vm_os_sku="16.04-LTS"
  remote_port="22"
  nb_instances=1
  nb_public_ip="1"
  public_ip_address_allocation="static"
  public_ip_dns=["table7jkapp"]
  vnet_subnet_id="${module.network.vnet_subnets[0]}"
}
module "network" {
  source="Azure/network/azurerm"
  location="${var.location}"
  resource_group_name="${var.rg}"
}
output "vm_public_name"{
  value="${module.linux.public_ip_dns_name}"
}
output "vm_public_ip"{
   value="${module.linux.public_ip_address}"
}

output "vm_private_ips"{
  value="${module.linux.network_interface_private_ip}"
}
