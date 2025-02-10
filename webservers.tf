resource "azurerm_virtual_machine" "vm" {
  count                 = length(var.vm_names)
  name                  = var.vm_names[count.index]
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  vm_size               = "Standard_B1s"

  # Assuming you have an existing network and image
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    name              = "${var.vm_names[count.index]}-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  admin_username = "adminuser"
  admin_password = "P@ssword1234"  # Use a more secure method like Azure Key Vault
}
