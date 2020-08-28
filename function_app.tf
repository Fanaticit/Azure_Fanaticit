# resource "azurerm_storage_account" "example" {
#   name                     = "fanazuresa"
#   resource_group_name      = azurerm_resource_group.example.name
#   location                 = azurerm_resource_group.example.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_app_service_plan" "example" {
#   name                = "fan-azure-functions-test-service-plan"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   sku {
#     tier = "Standard"
#     size = "S1"
#   }
# }

# resource "azurerm_function_app" "example" {
#   name                      = "fan-test-azure-functions-hamster"
#   location                  = azurerm_resource_group.example.location
#   resource_group_name       = azurerm_resource_group.example.name
#   app_service_plan_id       = azurerm_app_service_plan.example.id
#   storage_connection_string = azurerm_storage_account.example.primary_connection_string
# }

# resource "azurerm_function_app_slot" "example" {
#   name                       = "gerbil"
#   location                   = azurerm_resource_group.example.location
#   resource_group_name        = azurerm_resource_group.example.name
#   app_service_plan_id        = azurerm_app_service_plan.example.id
#   function_app_name          = azurerm_function_app.example.name
#   storage_account_name       = azurerm_storage_account.example.name
#   storage_account_access_key = azurerm_storage_account.example.primary_access_key
# }