data "azurerm_network_interface" "nic-data-block" {
    for_each = var.vm_map
  name                = each.value.nicname
  resource_group_name = each.value.rgname
}
