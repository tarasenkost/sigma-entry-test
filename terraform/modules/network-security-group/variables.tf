variable "resource_group_name" {
  type        = string
  description = "Required. The resource group name where NSG will be created."
}

variable "location" {
  type        = string
  description = "Required. Azure region for the NSG."
}

variable "name" {
  type        = string
  description = "Required. Name of the NSG."
}

variable "associated_subnets" {
  description = "Optional. List of subnet IDs to associate with this network security group."
  type        = map(string)
  default     = {}
}

variable "inbound_rules" {
  description = "Optional. List of objects that represent the configuration of each inbound rule."
  type = list(object({
    name                         = string
    access                       = string
    protocol                     = string
    priority                     = optional(number)
    source_address_prefix        = optional(string)
    source_address_prefixes      = optional(list(string))
    source_port_range            = optional(string)
    source_port_ranges           = optional(list(string))
    destination_address_prefix   = optional(string)
    destination_address_prefixes = optional(list(string))
    destination_port_range       = optional(string)
    destination_port_ranges      = optional(list(string))
    description                  = optional(string)
  }))
  default = []
}

variable "outbound_rules" {
  description = "Optional. List of objects that represent the configuration of each outbound rule"
  type = list(object({
    name                         = string
    access                       = string
    protocol                     = string
    priority                     = optional(number)
    source_address_prefix        = optional(string)
    source_address_prefixes      = optional(list(string))
    source_port_range            = optional(string)
    source_port_ranges           = optional(list(string))
    destination_address_prefix   = optional(string)
    destination_address_prefixes = optional(list(string))
    destination_port_range       = optional(string)
    destination_port_ranges      = optional(list(string))
    description                  = optional(string)
  }))
  default = []
}

variable "enable" {
  type        = bool
  description = "Enable the NSG creation?"
}