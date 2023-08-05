resource "azurerm_service_plan" "app_service_plan" {
  name                = format("%s-%s", var.app_service_plan_name, "appserviceplan")
  location            = var.region
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "B1"
  depends_on = [
    azurerm_resource_group.rg
  ]
}