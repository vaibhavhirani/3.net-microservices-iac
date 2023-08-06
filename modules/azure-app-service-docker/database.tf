# resource "azurerm_cosmosdb_account" "cosmos_db_account" {
#   name                      = format("%s-%s", var.cosmos_db_name, "cosmosdbacc")
#   location                  = var.region
#   resource_group_name       = var.resource_group_name
#   offer_type                = "Standard"
#   kind                      = "GlobalDocumentDB"
#   enable_automatic_failover = false
#   geo_location {
#     location          = "East US"
#     failover_priority = 0
#   }
#   consistency_policy {
#     consistency_level       = "BoundedStaleness"
#     max_interval_in_seconds = 300
#     max_staleness_prefix    = 100000
#   }
#   depends_on = [
#     azurerm_resource_group.rg
#   ]
# }

# resource "azurerm_cosmosdb_sql_database" "main" {
#   name                = format("%s-%s", var.cosmos_db_name, "sqlcosmosdb")
#   resource_group_name = var.resource_group_name
#   account_name        = azurerm_cosmosdb_account.cosmos_db_account.name
#   autoscale_settings {
#     max_throughput = var.max_throughput
#   }
# }

# resource "azurerm_cosmosdb_sql_container" "example" {
#   name                  = format("%s-%s", var.cosmos_db_name, "sqlcontainercosmosdb")
#   resource_group_name   = var.resource_group_name
#   account_name          = azurerm_cosmosdb_account.cosmos_db_account.name
#   database_name         = azurerm_cosmosdb_sql_database.main.name
#   partition_key_path    = "/definition/id"
#   partition_key_version = 1
#   autoscale_settings {
#     max_throughput = var.max_throughput
#   }

#   indexing_policy {
#     indexing_mode = "consistent"

#     included_path {
#       path = "/*"
#     }

#     included_path {
#       path = "/included/?"
#     }

#     excluded_path {
#       path = "/excluded/?"
#     }
#   }

#   unique_key {
#     paths = ["/definition/idlong", "/definition/idshort"]
#   }
# }
