provider "azurerm" {
    version        = "~>2.0"
    features {}
    #use_msi         = true
    #subscription_id = "0259557f-b013-4d0c-ae55-0722baa1d258"
    #tenant_id       = "f8cdef31-a31e-4b4a-93e4-5f571e91255a"
}

resource "random_id" "server" {
  keepers = {
    azi_id = 1
  }

  byte_length = 8
}

resource "azurerm_resource_group" "example" {
  name     = "azure-functions-test-rg"
  location = "westus2"
}

resource "azurerm_app_service_plan" "example" {
  name                = "some-app-service-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = random_id.server.hex
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}

resource "azurerm_app_service_slot" "example" {
  name                    = "prelive"
  #app_service_name        = each.value.name
  #location                = azurerm_resource_group.web-rg.location
  #resource_group_name     = azurerm_resource_group.web-rg.name
  #app_service_plan_id     = azurerm_app_service_plan.web.id
  client_affinity_enabled = true

  #name                = random_id.server.hex
  app_service_name    = azurerm_app_service.example.name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}
