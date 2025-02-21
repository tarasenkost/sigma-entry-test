resource "azurerm_virtual_network" "this" {
  count               = var.enable ? 1 : 0
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.vnet_name
  address_space       = var.address_space
  tags                = var.tags
}

resource "azurerm_subnet" "this" {
  for_each             = var.enable ? var.subnets : {}
  resource_group_name  = azurerm_virtual_network.this[0].resource_group_name
  virtual_network_name = azurerm_virtual_network.this[0].name

  name                              = each.value.name
  address_prefixes                  = each.value.address_prefixes
  default_outbound_access_enabled   = each.value.default_outbound_access_enabled
  private_endpoint_network_policies = each.value.private_endpoint_network_policies
  service_endpoints                 = each.value.service_endpoints
}
