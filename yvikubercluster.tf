resource "azurerm_resource_group" "yviclusterrg" {
  name     = "yvi-clusterrg"
  location = "eastus"
}

resource "azurerm_kubernetes_cluster" "yvicluster" {
  name                = "yvicluster-aks1"
  location            = azurerm_resource_group.yviclusterrg.location
  resource_group_name = azurerm_resource_group.yviclusterrg.name
  dns_prefix          = "yviclusterleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.yvicluster.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}
