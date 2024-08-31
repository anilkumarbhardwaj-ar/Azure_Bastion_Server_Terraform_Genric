resource "azurerm_windows_virtual_machine" "vm_block" {
  for_each = var.vm_map
  name                = each.value.name
  resource_group_name = each.value.rgname
  location            = each.value.location
  size                = each.value.size           
  admin_username      = each.value.username         
  admin_password      = each.value.pass       

  # Need Nic id 

  network_interface_ids = [data.azurerm_network_interface.nic-data-block[each.key].id]

 # Nested Blocks for Network Interface Configuration
  os_disk {
    caching              = each.value.os_disk.caching 
    storage_account_type = each.value.os_disk.sgacount 
  }

# Nested Blocks for Network Interface Configuration

  source_image_reference {
    publisher = each.value.source_image_reference.publisher #"MicrosoftWindowsServer"
    offer     = each.value.source_image_reference.offer    #"WindowsServer"
    sku       = each.value.source_image_reference.sku      #"2016-Datacenter"
    version   = each.value.source_image_reference.version #"latest"
  }
}
