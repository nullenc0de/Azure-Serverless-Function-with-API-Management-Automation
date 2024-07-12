# variables.tf

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "function_app_name" {
  description = "Name of the Function App"
  type        = string
}

variable "api_management_name" {
  description = "Name of the API Management instance"
  type        = string
}

variable "publisher_name" {
  description = "Name of the API publisher"
  type        = string
}

variable "publisher_email" {
  description = "Email of the API publisher"
  type        = string
}

variable "api_name" {
  description = "Name of the API"
  type        = string
}

variable "api_display_name" {
  description = "Display name of the API"
  type        = string
}

variable "api_path" {
  description = "Base path for the API"
  type        = string
}
