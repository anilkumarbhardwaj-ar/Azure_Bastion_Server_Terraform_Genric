resource "azurerm_bastion_host" "bastion-block" {
    for_each = var.bastion-map
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname

# Nested Block
  ip_configuration {
    name                 = each.value.ip_configuration.name
    subnet_id            = data.azurerm_subnet.nic_data[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip-data-block[each.key].id
  }
}
