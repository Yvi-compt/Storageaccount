variable "subscription_id"{
  type=string
}

variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "tenant_id"{
  type=string
}
/* variable "storage_id"{
  type=string
 default = "premium" 
}*/
variable "mcitvm_names" {
  type    = list(string)
  default = ["web-server-1", "web-server-2", "web-server-3", "webserver-4", "webserver-5", "webserver-6", "webserver-7", "webserver-8","webserver-9", "webserver-10"]
}
variable "yvinet_interfaces" {
  type    = list(string)
  default = ["nic-web1", "nic-web2", "nic-web3", "nic-web4","nic-web5", "nic-web6", "nic-web7", "nic-web8","nic-web9", "nic-web10"]
 
}
variable "admin_user"{
type=string
}
variable "admin_password"{
type=string
}
variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure"
  type        = string
  default     = "my-resource-group"
}
variable "location" {
  description = "Localisation des ressources Azure"
  type        = string
  default     = "estus"
}
variable "aks_cluster_name" {
  description = "Nom du cluster AKS"
  type        = string
  default     = "yvi-aks-cluster"
}
variable "node_pools" {
  description = "Configuration des node pools"
  type = map(object({
    node_count = number
    vm_size    = string
  }))
  default = {
    "pool1" = {
      node_count = 1
      vm_size    = "Standard_DS2_v2"
    },
    "pool2" = {
      node_count = 2
      vm_size    = "Standard_DS3_v2"
    }
  }
}
