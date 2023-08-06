# App Service Plan to accomodate our containerized .dotnet application (required)
resource "azurerm_service_plan" "app_service_plan" {
  name                = format("%s-%s", var.app_service_plan_name, "appserviceplan")
  location            = var.region
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "P1v2" #P1v2 is least required for having deployment slots - staging and production
  depends_on = [
    azurerm_resource_group.rg #Waits for the creation of resource group
  ]
}

# App Service Web App that runs on docker (linux). 
resource "azurerm_linux_web_app" "webapp" {
  name                  = format("%s%s", var.app_service_name, "3net")
  location              = var.region
  resource_group_name   = var.resource_group_name
  service_plan_id       = azurerm_service_plan.app_service_plan.id
  https_only            = true
  site_config { 
       always_on        = true

  # Below config is required to bootstrap app service as web app container.     
  application_stack {
    docker_image_name = "nginx:latest"
    docker_registry_url = "https://registry.hub.docker.com/v2/"
  }
  }
  }

# Creates staging slot for staging environment. Production slot is by default created
resource "azurerm_linux_web_app_slot" "staging_slot" {
  name           = "staging"
  app_service_id = azurerm_linux_web_app.webapp.id
  site_config { 
       always_on        = true
  application_stack {
    docker_image_name = "nginx:latest"
    docker_registry_url = "https://registry.hub.docker.com/v2/"
  }
  }
}