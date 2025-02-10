resource "azurerm_virtual_machine" "mcityvesvm" {
  count                 = length(var.mcitvm_names)
  name                  = var.mcitvm_names[count.index]
  location              = azurerm_resource_group.storagerg.location
  resource_group_name   = azurerm_resource_group.storagerg.name
  vm_size               = "Standard_B1s"


resource "azurerm_network_interface" "nic" {
  for_each            = toset(var.yvinet_interfaces)
  name                = each.key
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
  # Assuming you have an existing network and image
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
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
