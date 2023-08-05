terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0, < 4.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name =  "terraformbackenddotnet"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = "Central India"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "terraformbackenddotnet"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = false

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}


module "my_eks_module" {
  source = "./modules/azure-app-service-docker"  
}

output "azure_container_registry" {
    value = module.my_eks_module.azure_container_registry
    # sensitive = true
}
output "azure_container_registry_admin_username" {
    value = module.my_eks_module.azure_container_registry_admin_username
    sensitive = true
}
output "azure_container_registry_admin_password" {
    value = module.my_eks_module.azure_container_registry_admin_password
    sensitive = true
}


