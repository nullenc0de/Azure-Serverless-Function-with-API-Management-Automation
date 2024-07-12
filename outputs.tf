// outputs.tf

output "function_app_url" {
  value = azurerm_function_app.example.default_hostname
}

output "storage_account_id" {
  value = azurerm_storage_account.example.id
}
