output "network_security_group_id" {
  description = "The ID of the newly created network security group"
  value       = length(azurerm_network_security_group.this) > 0 ? azurerm_network_security_group.this[0].id : null

}

output "network_security_group_name" {
  description = "The name of the newly created network security group"
  value       = length(azurerm_network_security_group.this) > 0 ? azurerm_network_security_group.this[0].name : null
}
