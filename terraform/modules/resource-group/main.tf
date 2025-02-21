resource "azurerm_resource_group" "this" {
  count    = var.enable ? 1 : 0
  location = var.location
  name     = var.name
  tags     = var.tags
}