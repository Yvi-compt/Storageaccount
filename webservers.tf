resource "azurerm_network_interface" "yvirnic" {
  count               = 10  # Creates ten NICs dynamically
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
  location              = azurerm_resource_group.storagerg.location
  resource_group_name   = azurerm_resource_group.storagerg.name
  vm_size               = "Standard_B1s"

storage_os_disk {
    name              = "os-disk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
   # Assuming you have an existing network and image
  network_interface_ids = [azurerm_network_interface.yvirnic[count.index].id]
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
 os_profile {
    computer_name  = "mcityvesvm-${count.index}"
    admin_username = "adminuser"
    admin_password = "P@ssword1234"  # Use Azure Key Vault for security
  }
 
     os_profile_linux_config {
      disable_password_authentication = false
  }
}
