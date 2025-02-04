/*provider "azurerm" {
    feature {}
}*/
resource "azurerm_resource_group" "storagerg" {
  name     = "Storage.rg"
  location = "eastus"
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = "storageaccountyp"
  resource_group_name      = azurerm_resource_group.storagerg.name
  location                 = azurerm_resource_group.storagerg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
