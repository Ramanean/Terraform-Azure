variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
  default     = "eastus2"
}

variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "rg"
}

variable "storage_account_name_prefix" {
  type        = string
  description = "Prefix of the storage account name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "sa"
}

variable "storage_account_tier" {
  type        = string
  description = "Tier of the storage account."
  default     = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Replication type of the storage account."
  default     = "LRS"
}

variable "storage_account_kind" {
  type        = string
  description = "Kind of the storage account."
  default     = "StorageV2"
}

variable "storage_account_access_tier" {
  type        = string
  description = "Access tier of the storage account."
  default     = "Hot"
}