terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0, < 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "my_eks_module" {
  source = "./modules/azure-app-service-docker"  
}

output "azure_container_registry" {
    value = module.my_eks_module.azure_container_registry
}
output "azure_container_registry_admin_username" {
    value = module.my_eks_module.azure_container_registry_admin_username
}
output "azure_container_registry_admin_password" {
    value = module.my_eks_module.azure_container_registry_admin_password
}


