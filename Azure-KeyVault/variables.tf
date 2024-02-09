variable "resource_group_location" {
  type        = string
  description = "Location for all resources."
  default     = "eastus"
}

variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "rg"
}

variable "vault_name" {
  type        = string
  description = "The name of the key vault to be created. The value will be randomly generated if blank."
  default     = "TerraformTest"
}

variable "key_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
  default     = "TerraformTestKey"
}

variable "sku_name" {
  type        = string
  description = "The SKU of the vault to be created."
  default     = "standard"
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The sku_name must be one of the following: standard, premium."
  }
}

variable "key_permissions" {
  type        = list(string)
  description = "List of key permissions."
  default     = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy"]
}

variable "secret_permissions" {
  type        = list(string)
  description = "List of secret permissions."
  default     = ["Set"]
}

variable "key_type" {
  description = "The JsonWebKeyType of the key to be created."
  default     = "RSA"
  type        = string
  validation {
    condition     = contains(["EC", "EC-HSM", "RSA", "RSA-HSM"], var.key_type)
    error_message = "The key_type must be one of the following: EC, EC-HSM, RSA, RSA-HSM."
  }
}

variable "key_ops" {
  type        = list(string)
  description = "The permitted JSON web key operations of the key to be created."
  default     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
}

variable "key_size" {
  type        = number
  description = "The size in bits of the key to be created."
  default     = 2048
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. If this value isn't null (the default), 'data.azurerm_client_config.current.object_id' will be set to this value."
  default     = null
}

variable "key_retention"{
    type        = number
    description = "The number of days a key is retained before being deleted for a soft delete-enabled Key Vault. The number must be between 7 and 90."
    default     = 30
    validation {
        condition     = var.key_retention >= 7 && var.key_retention <= 90
        error_message = "The key_retention must be between 7 and 90."
    }
}

variable "key_vault_access_policy" {
  type        = list(object({
    object_id = string
    tenant_id = string
    key_permissions = list(string)
    secret_permissions = list(string)
  }))
  description = "List of access policies for the key vault."
  default     = []
}

variable "key_vault_network_acls" {
  type        = list(object({
    bypass         = list(string)
    default_action = string
    ip_rules       = list(string)
    virtual_network_subnet_ids = list(string)
  }))
  description = "List of network ACLs for the key vault."
  default     = []
}
  
variable "key_vault_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}

variable "key_vault_enabled_for_deployment" {
  type        = bool
  description = "Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  default     = true
}

variable "key_vault_enabled_for_disk_encryption" {
  type        = bool
  description = "Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  default     = true
}

variable "key_vault_enabled_for_template_deployment" {
  type        = bool
  description = "Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  default     = true
}
