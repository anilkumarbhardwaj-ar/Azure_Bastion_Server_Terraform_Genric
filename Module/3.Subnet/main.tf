resource "azurerm_subnet" "sub_block" {
  for_each = var.sub_map
  name                 = each.value.name
  resource_group_name  = each.value.rgname
  virtual_network_name = each.value.vnet
  address_prefixes     = each.value.address_prefixes
}