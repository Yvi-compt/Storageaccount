resource "azurerm_network_interface" "yvirnic" {
  count               = 10  # Creates two NICs dynamically
  name                = "nic-${count.index}"
  location            = azurerm_resource_group.storagerg.location
  resource_group_name = azurerm_resource_group.storagerg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.virsubneta.id
    private_ip_address_allocation = "Dynamic"
  }
  }
resource "azurerm_virtual_machine" "mcityvesvm" {
  count                 = 10  # Same count as the NICs
  name                  = "mcityvesvm-${count.index}"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  vm_size               = "Standard_B1s"
  network_interface_ids = [azurerm_network_interface.yvirnic[count.index].id]



  # Assuming you have an existing network and image
  network_interface_ids = [azurerm_network_interface.yvinet_interfaces[count.index].id]
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    name              = "${var.mcitvm_names[count.index]}-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  admin_username = "adminuser"
  admin_password = "P@ssword1234"  # Use a more secure method like Azure Key Vault
}
