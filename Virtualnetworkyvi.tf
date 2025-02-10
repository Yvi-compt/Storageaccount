resource "azurerm_virtual_network" "virnet" {
  name                = "vnetwork"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.storagerg.location
  resource_group_name = azurerm_resource_group.storagerg.name
}

resource "azurerm_subnet" "subneta" {
  name                 = "subnet-a"
  resource_group_name  = azurerm_resource_group.storagerg.name
  virtual_network_name = azurerm_virtual_network.virnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
