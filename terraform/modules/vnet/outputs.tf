output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = length(azurerm_virtual_network.this) > 0 ? azurerm_virtual_network.this[0].address_space : null
}

output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = length(azurerm_virtual_network.this) > 0 ? azurerm_virtual_network.this[0].id : null

}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = length(azurerm_virtual_network.this) > 0 ? azurerm_virtual_network.this[0].location : null

}

output "vnet_name" {
  description = "The name of the newly created vNet"
  value       = length(azurerm_virtual_network.this) > 0 ? azurerm_virtual_network.this[0].name : null
}

output "subnet_ids" {
  description = "A map of subnet IDs keyed by subnet name."
  value       = var.enable ? { for name, subnet in azurerm_subnet.this : name => subnet.id } : {}
}
