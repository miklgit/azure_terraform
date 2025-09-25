resource "azurerm_public_ip" "vm_alma9" {
  count               = var.vm_alma9_count
  name                = "${var.vm_alma9_properties.prefix_name}-${count.index + 1}-${var.ip_public_suffix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = var.ip_public_allocation_method_default
}

resource "azurerm_network_interface" "vm_alma9" {
  count               = var.vm_alma9_count
  name                = "${var.vm_alma9_properties.prefix_name}-${count.index + 1}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.network_interface_ip_configuration_name_default
    subnet_id                     = azurerm_subnet.vnet_subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation_default
    public_ip_address_id          = azurerm_public_ip.vm_alma9[count.index].id
  }
}

resource "azurerm_network_interface_security_group_association" "vm_alma9" {
  count                     = var.vm_alma9_count
  network_interface_id      = azurerm_network_interface.vm_alma9[count.index].id
  network_security_group_id = azurerm_network_security_group.net_security_group.id
}

resource "azurerm_linux_virtual_machine" "vm_alma9" {
  count                 = var.vm_alma9_count
  name                  = "${var.vm_alma9_properties.prefix_name}-${count.index + 1}"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.vm_alma9[count.index].id]
  size                  = var.vm_size_default
  os_disk {
    name                 = "${var.vm_alma9_properties.prefix_name}-${count.index + 1}-${var.vm_os_disk_name_suffix}"
    disk_size_gb         = var.vm_os_disk_size_gb
    caching              = var.vm_os_disk_caching_default
    storage_account_type = var.vm_storage_account_type_default
  }

  source_image_reference {
    publisher = var.vm_alma9_properties.publisher
    offer     = var.vm_alma9_properties.offer
    sku       = var.vm_alma9_properties.sku
    version   = var.vm_alma9_properties.version
  }

  computer_name  = "${var.vm_alma9_properties.prefix_name}-${count.index + 1}"
  disable_password_authentication = false
  admin_username = var.vm_username
  admin_password = var.vm_password

  # admin_ssh_key {
  #   username   = var.vm_username
  #   public_key = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
  # }
}