variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "mutistorage-group"
}

variable "location" {
  type        = string
  description = "Resource group location"
  default     = "uksouth"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name"
  default     = "Saanvikitsa"
}
