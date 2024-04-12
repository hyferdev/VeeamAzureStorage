# DataCenter IP
variable "datacenter_ip_address" {
  description = "Static IP address to allow HTTPS traffic from"
  default     = "123.123.123.123"
}

variable "client_ip_address" {
  description = "Static IP address to allow HTTPS traffic from"
  default     = "124.124.124.124"
}

variable "client_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["192.168.200.0/24"]
}

variable "hot_storage_name" {
  description = "Name of the storage account with hot access tier"
  type        = string
  default     = "stvbrxxx"
}

variable "cool_storage_name" {
  description = "Name of the storage account with cool access tier"
  type        = string
  default     = "stvbrarchxxx"
}


