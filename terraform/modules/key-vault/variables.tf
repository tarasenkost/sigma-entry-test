variable "key_vaults" {
  description = "Key-vaults and their specific configuration"
  type = list(object({
    name                       = optional(string)
    sku_name                   = optional(string, "standard")
    purge_protection_enabled   = optional(bool, false)
    soft_delete_retention_days = optional(number, 7) #value between 7 and 90 days

    enabled_for_deployment          = optional(bool, false)
    enabled_for_disk_encryption     = optional(bool, false)
    enabled_for_template_deployment = optional(bool, false)
    enable_rbac_authorization       = optional(bool, false)
    tags                            = optional(map(string))
  }))
}

variable "resource_group_name" {
  type        = string
  description = "Required. The resource group name where NSG will be created."
}

variable "location" {
  type        = string
  description = "Required. Azure region for the NSG."
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the Key Vault. Default is the current one."
  type        = string
  default     = ""
}

variable "name_random_suffix_byte_lenght" {
  type        = number
  description = "Required. The lengh of random suffix for vault names."
}

variable "enable" {
  type        = bool
  description = "Required. Enable resource creation?"
}