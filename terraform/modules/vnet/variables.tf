variable "resource_group_name" {
  type        = string
  description = "Required. Name of the resource group to create."
}

variable "location" {
  type        = string
  description = "Required. The location of the vNet to create."
}

variable "vnet_name" {
  type        = string
  description = "Required. Name of the vNet to create"
}

variable "address_space" {
  type        = list(string)
  description = "Optional. The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Optional. Tags of your network and subnets."
}

variable "subnets" {
  description = "Optional. A map of subnets to create in vnet"
  type = map(object({
    name                              = string
    address_prefixes                  = list(string)
    default_outbound_access_enabled   = optional(bool, true)
    private_endpoint_network_policies = optional(string, "Disabled")
    service_endpoints                 = optional(list(string), null)
  }))
  default = {}
}

variable "enable" {
  type        = bool
  description = "Required. Enable resource creation?"
}