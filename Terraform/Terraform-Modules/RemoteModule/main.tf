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
    key                  = "remotemodule.terraform.tfstate"
  }
}

module "storage_account" {
  source               = "git::https://github.com/azureramakrishna/AzureDevops-June2023.git"
  resource_group_name  = "remote-module-resource-group"
  location             = "uksouth"
  storage_account_name = "saanvikitmodulesa"
}

