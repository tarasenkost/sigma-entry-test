locals {
  kv_map = { for kv in var.key_vaults : kv.name => kv }
}

resource "random_id" "name_suffix" {
  for_each    = local.kv_map
  byte_length = var.name_random_suffix_byte_lenght
}

resource "azurerm_key_vault" "this" {
  for_each = local.kv_map

  name                            = "${each.value.name}-${random_id.name_suffix[each.key].hex}"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tenant_id                       = var.tenant_id
  sku_name                        = lower(each.value.sku_name)
  purge_protection_enabled        = each.value.purge_protection_enabled
  soft_delete_retention_days      = each.value.soft_delete_retention_days
  enabled_for_deployment          = each.value.enabled_for_deployment
  enabled_for_disk_encryption     = each.value.enabled_for_disk_encryption
  enabled_for_template_deployment = each.value.enabled_for_template_deployment
  enable_rbac_authorization       = each.value.enable_rbac_authorization
  tags                            = each.value.tags
}


