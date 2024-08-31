resource "azurerm_resource_group" "rg_block" {
    for_each = var.rg_map
    name = each.value.name
    location = each.value.location
  
}

# what is Terraform?
# what is terraform state file?
# what is terraform state locking system?
# when will be the terraform state file generated ?
# After run terraform init cmd -->> What will be happned?
# What is use of terraform plan cmd ?
# What is variable in terraform?
# What is data type in terraform ?
# Why we use map use in terraform ?
# 