output "azure_container_registry" {
    value = azurerm_container_registry.acr.login_server
}
output "azure_container_registry_admin_username" {
    value = azurerm_container_registry.acr.admin_username
}
output "azure_container_registry_admin_password" {
    value = azurerm_container_registry.acr.admin_password
}


