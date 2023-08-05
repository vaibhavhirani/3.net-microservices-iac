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

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.region
}
