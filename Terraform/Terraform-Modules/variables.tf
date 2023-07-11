variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Resource group location"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name"
}

variable "virtual_network_name" {
  type        = string
  description = "Virtual Network name"
}

variable "virtual_network_address" {
  type    = list(any)
}

variable "subnet_name" {
  type        = string
  description = "subnet name"
}

variable "subnet_address" {
  type    = list(any)
}

variable "publicip_name" {
  type    = string
}

variable "network_security_group_name" {
  type    = string
}

variable "network_interface_name" {
  type    = string
}

variable "virtual_machine_name" {
  type    = string
}

variable "virtual_machine_size" {
  type    = string
}

variable "adminUser" {
  type    = string
}

variable "adminPassword" {
  type    = string
}