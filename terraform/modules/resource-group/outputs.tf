output "resourcegroup" {
  description = "This is the full output for the resource group."
  value       = length(azurerm_resource_group.this) > 0 ? azurerm_resource_group.this[0] : null
}

output "name" {
  description = "The name of the resource group"
  value       = length(azurerm_resource_group.this) > 0 ? azurerm_resource_group.this[0].name : null
}

output "location" {
  description = "The location of the resource group"
  value       = length(azurerm_resource_group.this) > 0 ? azurerm_resource_group.this[0].location : null
}

output "resourcegroup_id" {
  description = "The resource Id of the resource group"
  value       = length(azurerm_resource_group.this) > 0 ? azurerm_resource_group.this[0].id : null
}