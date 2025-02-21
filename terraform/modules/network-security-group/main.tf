resource "azurerm_network_security_group" "this" {
  count               = var.enable ? 1 : 0
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.inbound_rules
    content {
      direction                    = "Inbound"
      priority                     = coalesce(security_rule.value.priority, 100 + index(var.inbound_rules, security_rule.value))
      name                         = security_rule.value.name
      access                       = security_rule.value.access
      protocol                     = security_rule.value.protocol
      source_port_range            = security_rule.value.source_port_range
      source_port_ranges           = security_rule.value.source_port_ranges
      source_address_prefix        = security_rule.value.source_address_prefix
      source_address_prefixes      = security_rule.value.source_address_prefixes
      destination_port_range       = security_rule.value.destination_port_range
      destination_port_ranges      = security_rule.value.destination_port_ranges
      destination_address_prefix   = security_rule.value.destination_address_prefix
      destination_address_prefixes = security_rule.value.destination_address_prefixes
      description                  = security_rule.value.description
    }
  }

  dynamic "security_rule" {
    for_each = var.outbound_rules
    content {
      direction                    = "Outbound"
      priority                     = coalesce(security_rule.value.priority, 100 + index(var.outbound_rules, security_rule.value))
      name                         = security_rule.value.name
      access                       = security_rule.value.access
      protocol                     = security_rule.value.protocol
      source_port_range            = security_rule.value.source_port_range
      source_port_ranges           = security_rule.value.source_port_ranges
      source_address_prefix        = security_rule.value.source_address_prefix
      source_address_prefixes      = security_rule.value.source_address_prefixes
      destination_port_range       = security_rule.value.destination_port_range
      destination_port_ranges      = security_rule.value.destination_port_ranges
      destination_address_prefix   = security_rule.value.destination_address_prefix
      destination_address_prefixes = security_rule.value.destination_address_prefixes
      description                  = security_rule.value.description
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each                  = var.associated_subnets
  network_security_group_id = azurerm_network_security_group.this[0].id
  subnet_id                 = each.value
}