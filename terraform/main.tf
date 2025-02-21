locals {
  install_base = true
  location     = "westus2"
  tenant_id    = data.azurerm_client_config.current.tenant_id
  default_tags = {
    project = "sigma"
  }
}

module "resource_group" {
  source = "./modules/resource-group"
  enable = local.install_base

  name     = "${local.default_tags.project}-rg"
  location = local.location
  tags = {
    created-by = "terraform"
  }
}

module "vnet" {
  source = "./modules/vnet"
  enable = local.install_base

  vnet_name           = "${local.default_tags.project}-vnet"
  location            = local.location
  resource_group_name = module.resource_group.name
  address_space       = ["10.0.0.0/16"]
  subnets = {
    "subnet1" = {
      name             = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
    }
    "subnet2" = {
      name             = "subnet2"
      address_prefixes = ["10.0.101.0/24"]
    }
  }
}

module "network_security_group" {
  source = "./modules/network-security-group"
  enable = local.install_base

  name                = "${local.default_tags.project}-nsg"
  resource_group_name = module.resource_group.name
  location            = local.location
  inbound_rules = [
    {
      name                       = "allow-ssh"
      priority                   = 100
      access                     = "Allow"
      protocol                   = "Tcp"
      source_address_prefixes    = ["5.5.5.5", "10.10.10.10"]
      source_port_range          = "22"
      destination_address_prefix = "*"
      destination_port_range     = "*"
      description                = "inbound_rule_1"
    },
  ]
  outbound_rules = [
    {
      name                       = "deny-icmp"
      priority                   = 101
      access                     = "Deny"
      protocol                   = "Icmp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "*"
      description                = "inbound_rule_2"
    },
  ]
  associated_subnets = {
    subnet1 = module.vnet.subnet_ids["subnet1"]
  }
}

module "key_vaults" {
  source = "./modules/key-vault"
  enable = local.install_base

  location            = local.location
  tenant_id           = local.tenant_id
  resource_group_name = module.resource_group.name
  name_random_suffix_byte_lenght = 3
  key_vaults = [
    {
      name                       = "kv1"
      sku_name                   = "standard"
      purge_protection_enabled   = false
      soft_delete_retention_days = 14
      tags                       = { env = "dev" }
    },
    {
      name                       = "kv2"
      sku_name                   = "premium"
      purge_protection_enabled   = false
      soft_delete_retention_days = 7
      enabled_for_deployment     = true
      tags                       = { env = "stg" }
    }
  ]
}