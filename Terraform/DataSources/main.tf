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

  # client_id       = "ce1425fc-f3d9-4afa-a1df-9786245f41fc"
  # client_secret   = ""
  # tenant_id       = "459865f1-a8aa-450a-baec-8b47a9e5c904"
  # subscription_id = "6e4924ab-b00c-468f-ae01-e5d33e8786f8"
}

# terraform backend state
terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-centralindia"
    storage_account_name = "csg10032000825eeb72"
    container_name       = "tfstate"
    key                  = "data.terraform.tfstate"
  }
}

# Create a storage account
resource "azurerm_storage_account" "example" {
  name                     = lower(var.storage_account_name)
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

# Create public IP
resource "azurerm_public_ip" "example" {
  name                = var.publicip_name
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  allocation_method   = "Static"
}

# Create NSG
resource "azurerm_network_security_group" "example" {
  name                = var.network_security_group_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Subnet and NSG Association
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = data.azurerm_subnet.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}

resource "azurerm_network_interface" "example" {
  depends_on          = [data.azurerm_subnet.example, azurerm_public_ip.example]
  name                = var.network_interface_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    public_ip_address_id          = azurerm_public_ip.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  depends_on          = [azurerm_network_interface.example]
  name                = var.virtual_machine_name
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  size                = var.virtual_machine_size
  admin_username      = var.adminUser
  admin_password      = data.azurerm_key_vault_secret.example.value
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    name                 = "${var.virtual_machine_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}
