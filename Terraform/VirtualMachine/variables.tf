variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "volvo-resource-group"
}

variable "location" {
  type        = string
  description = "Resource group location"
  default     = "uksouth"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name"
  default     = "Saanvikit19062023"
}

variable "virtual_network_name" {
  type        = string
  description = "Virtual Network name"
  default     = "volvo-vnet-01"
}

variable "virtual_network_address" {
  type    = list(any)
  default = ["10.0.0.0/24"]
}

variable "subnet_name" {
  type        = string
  description = "subnet name"
  default     = "volvo-snet-01"
}

variable "subnet_address" {
  type    = list(any)
  default = ["10.0.0.0/25"]
}

variable "publicip_name" {
  type    = string
  default = "volvo-pubip-01"
}

variable "network_security_group_name" {
  type    = string
  default = "volvo-nsg-01"
}

variable "network_interface_name" {
  type    = string
  default = "volvo-nic-01"
}

variable "virtual_machine_name" {
  type    = string
  default = "volvo-vm-01"
}

variable "virtual_machine_size" {
  type    = string
  default = "Standard_B2s"
}

variable "adminUser" {
  type    = string
  default = "azureuser"
}

variable "adminPassword" {
  type    = string
  default = "Azuredevops@12345"
}