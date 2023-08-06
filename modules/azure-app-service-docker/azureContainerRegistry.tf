# Private Docker Registry for storing docker image
resource "azurerm_container_registry" "acr" {
  name                = format("%s", var.registry_name)
  resource_group_name = var.resource_group_name
  location            = var.region  
  sku                 = var.sku
  admin_enabled       = true
}