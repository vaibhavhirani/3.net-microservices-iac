terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }

  # sets the backend of tfstate files on Azure using below specs
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name =  "storageaccounttfstate"
      container_name       = "tfstatecontainer"
      key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Azure Resource Group Required for keeping tfstate backend resource together
resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = "Central India"
}

# Storage Account keeps tfstate container
resource "azurerm_storage_account" "tfstate" {
  name                     = "storageaccounttfstate"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # allow_blob_public_access = false
  tags = {
    environment = "staging"
  }
}


# Entity containing the tfstates.
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstatecontainer"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

# Consuming azure-app-service-docker module.
module "my_az_module" {
  source = "./modules/azure-app-service-docker"  
}

# Output variables
output "azure_container_registry" {
    value = module.my_az_module.azure_container_registry
    # sensitive = true
}
output "azure_container_registry_admin_username" {
    value = module.my_az_module.azure_container_registry_admin_username
    sensitive = true
}
output "azure_container_registry_admin_password" {
    value = module.my_az_module.azure_container_registry_admin_password
    sensitive = true
}


