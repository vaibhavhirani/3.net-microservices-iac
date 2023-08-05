output "azure_container_registry" {
    value = azurerm_container_registry.acr.login_server
    # sensitive = true
}
output "azure_container_registry_admin_username" {
    value = azurerm_container_registry.acr.admin_username
    sensitive = true
}
output "azure_container_registry_admin_password" {
    value = azurerm_container_registry.acr.admin_password
    sensitive = true
}



