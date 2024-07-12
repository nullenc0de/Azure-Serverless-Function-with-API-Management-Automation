# main.tf

# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# Create a storage account
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create an App Service Plan
resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "FunctionApp"
  
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

# Create a Function App
resource "azurerm_function_app" "example" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  version                    = "~3"

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "node"
  }
}

# Deploy Function App code
resource "null_resource" "function_app_deploy" {
  depends_on = [azurerm_function_app.example]

  provisioner "local-exec" {
    command = "az functionapp deployment source config-zip -g ${azurerm_resource_group.example.name} -n ${azurerm_function_app.example.name} --src ${path.module}/functions/functionapp.zip"
  }
}

# Create an API Management instance
resource "azurerm_api_management" "example" {
  name                = var.api_management_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email

  sku_name = "Developer_1"
}

# Create an API within API Management
resource "azurerm_api_management_api" "example" {
  name                = var.api_name
  resource_group_name = azurerm_resource_group.example.name
  api_management_name = azurerm_api_management.example.name
  revision            = "1"
  display_name        = var.api_display_name
  path                = var.api_path
  protocols           = ["https"]

  import {
    content_format = "swagger-json"
    content_value  = file("${path.module}/api_management/api_definition.json")
  }
}

# Apply API policy
resource "azurerm_api_management_api_policy" "example" {
  api_name            = azurerm_api_management_api.example.name
  api_management_name = azurerm_api_management.example.name
  resource_group_name = azurerm_resource_group.example.name

  xml_content = file("${path.module}/api_management/api_policy.xml")
}
