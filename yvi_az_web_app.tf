/*provider "azurerm" {
  features {}
}
*/

/*resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}
*/

resource "azurerm_service_plan" "yviplan" {
  name                = "yvi-plan"
  resource_group_name = azurerm_resource_group.storagerg.name
  location            = azurerm_resource_group.storagerg.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "yviazurwebapp" {
  name                = "example"
  resource_group_name = azurerm_resource_group.storagerg.name
  location            = azurerm_service_plan.yviplan.location
  service_plan_id     = azurerm_service_plan.yviplan.id

  site_config {}
}
