terraform {    
  required_providers {    
    azurerm = {    
      source = "hashicorp/azurerm"    
    }    
  }    
} 
   
provider "azurerm" {    
  features {}    
}

# Resource Group, will contain all the resources created by this IaC/Terraform Module.
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.region
}
