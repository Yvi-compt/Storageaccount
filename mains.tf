resource "azurerm_resource_group" "storageyrg" {
  name     = "Storage.rg"
  location = "eastus"
}
resource "azurerm_kubernetes_cluster""yviaks"{
name        =var.aks_cluster_name
location    =azurer_resource_group.storageyrg.location
resource_group_name = azurerm_resource_group.storageyrg.name
 dns_prefix          = var.aks_cluster_name

 default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }
 identity {
    type = "SystemAssigned"
  }
}
resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pools" {
  for_each = var.node_pools

  name                  = each.key
  kubernetes_cluster_id = azurerm_kubernetes_cluster.yviaks.id
  vm_size               = each.value.vm_size
  node_count            = each.value.node_count
}
