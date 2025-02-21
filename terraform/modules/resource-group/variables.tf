variable "location" {
  type        = string
  description = "Required. Location of the resource group."
  nullable    = false
}

variable "name" {
  type        = string
  description = "Required. Name of the resource group."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Optional. Tags of the resource group."
}


variable "enable" {
  type        = bool
  description = "Required. Enable resource creation?"
}