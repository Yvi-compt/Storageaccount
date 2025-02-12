# Le output file of the cluster
output "aks_cluster_name" {
  description = "Nom du cluster AKS"
  value       = azurerm_kubernetes_cluster.yviaks.name
}

output "kube_config" {
  description = "Configuration Kubernetes (kubeconfig)"
  value       = azurerm_kubernetes_cluster.yviaks.kube_config_raw
  sensitive   = true
}

output "node_pool_names" {
  description = "Noms des node pools créés"
  value       = [for pool in azurerm_kubernetes_cluster_node_pool.aks_node_pools : pool.name]
}
