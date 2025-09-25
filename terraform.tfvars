# Resource group
resource_group_location    = "eastus"
resource_group_name_prefix = "rg"

# Network
network_security_group_name_prefix              = "nsg"
virtual_network_prefix                          = "vnet"
subnet_prefix                                   = "vnet-subnet-dev"
ip_public_suffix                                = "ip-public"
ip_public_allocation_method_default             = "Dynamic"
private_ip_address_allocation_default           = "Dynamic"
network_interface_ip_configuration_name_default = "nic_configuration"

# VMs
vm_storage_account_type_default = "Standard_LRS"
vm_size_default                 = "Standard_DS1_v2"
vm_os_disk_size_gb              = 150
vm_os_disk_name_suffix          = "osdisk"
vm_os_disk_caching_default      = "ReadWrite"
vm_username                     = "azureuser"
vm_password                     = "azureuser_001!"

vm_alma9_properties = {
  prefix_name = "alma9"
  publisher   = "almalinux"
  offer       = "almalinux-x86_64"
  sku         = "9-gen2"
  version     = "latest"
}
vm_ubuntu22_properties = {
  prefix_name = "ubuntu22"
  publisher   = "Canonical"
  offer       = "0001-com-ubuntu-server-jammy"
  sku         = "22_04-lts-gen2"
  version     = "latest"
}

# Nombre de VMs pour chaque type
vm_alma9_count    = 1
vm_ubuntu22_count = 0

