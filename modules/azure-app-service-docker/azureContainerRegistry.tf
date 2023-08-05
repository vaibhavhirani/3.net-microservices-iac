resource "azurerm_container_registry" "acr" {
  name                = format("%s-%s", var.registry_name, "registry")
  resource_group_name = var.resource_group_name
  location            = var.region  
  sku                 = var.sku
  admin_enabled       = true
}