# Use existing resourcegroup
data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

# Use existing VNET
data "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.example.name
}

# Use the existing subnet
data "azurerm_subnet" "example" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.example.name
  resource_group_name  = data.azurerm_resource_group.example.name
}

# Use the existing keyvault
data "azurerm_key_vault" "example" {
  name                = "saanvikitkv1"
  resource_group_name = "cloud-shell-storage-centralindia"
}

#Use the existing keyvault secret
data "azurerm_key_vault_secret" "example" {
  name         = "WinVMPassword"
  key_vault_id = data.azurerm_key_vault.example.id
}



