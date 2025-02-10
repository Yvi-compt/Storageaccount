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
  default = ["web-server-1", "web-server-2", "web-server-3", webserver-4, webserver-5, webserver-6, webserver-7, webserver-8,webserver-9, webserver-10]
}
