data "azurerm_subnet" "nic_data" {
    for_each = var.bastion-map
  name                 = each.value.sname
  virtual_network_name = each.value.vnet
  resource_group_name  = each.value.rgname
}

data "azurerm_public_ip" "pip-data-block" {
    for_each = var.bastion-map
  name                = each.value.pname
  resource_group_name = each.value.rgname
}