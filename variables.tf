# variable "azure_subscription_id" { sensitive = true }
# variable "azure_tenant_id" { sensitive = true }
# variable "azure_client_id" { sensitive = true }
# variable "azure_client_secret" { sensitive = true }

variable "resource_group_location" {}
variable "resource_group_name_prefix" {}

variable "network_security_group_name_prefix" {}
variable "virtual_network_prefix" {}
variable "subnet_prefix" {}
variable "ip_public_suffix" {}
variable "ip_public_allocation_method_default" {}
variable "private_ip_address_allocation_default" {}
variable "network_interface_ip_configuration_name_default" {}

variable "vm_storage_account_type_default" {}
variable "vm_size_default" {}
variable "vm_os_disk_size_gb" {}
variable "vm_os_disk_caching_default" {}
variable "vm_os_disk_name_suffix" {}
variable "vm_username" {}
variable "vm_password" {}
variable "vm_alma9_properties" {}
variable "vm_ubuntu22_properties" {}

variable "vm_alma9_count" {}
variable "vm_ubuntu22_count" {}
