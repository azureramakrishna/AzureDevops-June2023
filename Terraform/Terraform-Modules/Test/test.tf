#azurerm provider version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.50.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# terraform backend state
terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-centralindia"
    storage_account_name = "csg10032000825eeb72"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
  }
}

module "test" {
  source                      = "../"
  resource_group_name         = "test-resource-group"
  location                    = "eastus"
  storage_account_name        = "saanvikittestsa"
  virtual_network_name        = "test-vnet"
  virtual_network_address     = ["10.0.1.0/24"]
  subnet_name                 = "test-snet"
  subnet_address              = ["10.0.1.0/24"]
  publicip_name               = "test-pubip"
  network_security_group_name = "test-nsg"
  network_interface_name      = "test-nic"
  virtual_machine_name        = "test-vm"
  virtual_machine_size        = "Standard_Ds1_v2"
  adminUser                   = "azureuser"
  adminPassword               = "Azuredevops@12345"
}