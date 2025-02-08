/*resource "azurerm_storage_account" "yvistorageaccount" {
  name                     = "yistorageaccountname"
  resource_group_name      = azurerm_resource_group.storagerg.name
  location                 = azurerm_resource_group.storagerg.location
  account_tier             = var.account_tier
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
variable "storage_account_names" {
  type    = list(string)
  default = [
    "yvistorageaccountname1",
    "yvistorageaccountname2",
    "yvistorageaccountname3",
    "yvistorageaccountname4",
    "yvistorageaccountname5"
  ]
}
resource "azurerm_storage_account" "yvistorageaccountp" {
  count                    = length(var.storage_account_names)
  name                     = var.storage_account_names[count.index]
  resource_group_name      = azurerm_resource_group.storagerg.name
  location                 = azurerm_resource_group.storagerg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
*/
