// variables.tf

variable "region" {
  description = "Azure region to deploy resources"
  default     = "West Europe"
}

variable "function_app_name" {
  description = "Name of the Azure Function App"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
}
