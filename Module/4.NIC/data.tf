data "azurerm_subnet" "nic_data" {
    for_each = var.nic_map
  name                 = each.value.sname
  virtual_network_name = each.value.vnet
  resource_group_name  = each.value.rgname
}