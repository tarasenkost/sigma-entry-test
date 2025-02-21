output "key_vault_ids" {
  description = "Map of Key Vault names to their IDs"
  value       = var.enable ? [for kv in azurerm_key_vault.this : kv.id] : null
}

output "key_vault_names" {
  description = "Map of Key Vault names to their actual names"
  value       = var.enable ? { for kv, values in azurerm_key_vault.this : kv => values.name } : null
}

output "key_vault_uris" {
  description = "Map of Key Vault names to their Vault URIs"
  value       = var.enable ? { for kv, values in azurerm_key_vault.this : kv => values.vault_uri } : null
}

output "key_vault_tenant_ids" {
  description = "Map of Key Vault names to their tenant IDs"
  value       = var.enable ? { for kv, values in azurerm_key_vault.this : kv => values.tenant_id } : null
}
