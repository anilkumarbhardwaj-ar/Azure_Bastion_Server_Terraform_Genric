resource "azurerm_network_interface" "nic_block" {
for_each = var.nic_map
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname

# Nested Blocks for Network Interface Configuration

  ip_configuration {
    name                          = each.value.ip_configuration.name

    # data block - if we use for.each in data block - [each.key] 
    subnet_id                     = data.azurerm_subnet.nic_data[each.key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip
  }
}

