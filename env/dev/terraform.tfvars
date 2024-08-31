# adding the value in rg # Why we use - Map - 20-21 July- concept of maping 
rg-admin = {

  rg1 = {
    name     = "pawan-rg"
    location = "Central India"
  }

  rg2 = {
    name     = "ashish-rg"
    location = "west us"
  }

}

# Adding the value in Vnet 

vnet-admin = {

  vnet1 = {
    name          = "vnet-dev"
    location      = "Central India"
    rgname        = "pawan-rg"
    address_space = ["192.168.0.0/16"]

  }
  vnet2 = {
    name          = "vnet-prod"
    location      = "west us"
    rgname        = "ashish-rg"
    address_space = ["10.0.0.0/16"]

  }


}
# Adding the value in Subnet

sub-admin = {
  sub1 = {
    name             = "sub-dev"
    rgname           = "pawan-rg"
    vnet             = "vnet-dev"
    address_prefixes = ["192.168.0.0/29"]
  }

  sub2 = {
    name             = "sub-prod"
    rgname           = "ashish-rg"
    vnet             = "vnet-prod"
    address_prefixes = ["10.0.0.0/29"]
  }


  sub3 = {
    name             = "AzureBastionSubnet"
    rgname           = "ashish-rg"
    vnet             = "vnet-prod"
    address_prefixes = ["10.0.1.0/26"]
  }
}

# Adding the value in NIC

nic-admin = {
  nic1 = {
    name     = "nic-dev"
    location = "Central India"
    rgname   = "pawan-rg"

    # Subnet Data block values
    sname = "sub-dev"
    vnet  = "vnet-dev"

    # Nested Blocks for Network Interface Configuration
    ip_configuration = {
      name       = "Internal"
      private_ip = "Dynamic"
    }

  }

  nic2 = {
    name     = "nic-prod"
    location = "West us"
    rgname   = "ashish-rg"

    # Subnet Data block values
    sname = "sub-prod"
    vnet  = "vnet-prod"

    # Nested Blocks for Network Interface Configuration
    ip_configuration = {
      name       = "Internal"
      private_ip = "Dynamic"
    }

  }

}

# Adding the value in VM (We want to create two vm only)

vm-admin = {
  vm1 = {

    name     = "frontend-vm"
    rgname   = "pawan-rg"
    location = "Central India"
    size     = "Standard_F2"
    username = "ashisdev"
    pass     = "Root@1234!!"
    nicname  = "nic-dev"


    # Nested Blocks for Network Interface Configuration
    os_disk = {
      caching  = "ReadWrite"
      sgacount = "Standard_LRS"
    }

    # Nested Blocks for Network Interface Configuration

    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }
  }

  vm2 = {

    name     = "backend-vm"
    rgname   = "ashish-rg"
    location = "west us"
    size     = "Standard_F2"
    username = "ashishprod"
    pass     = "Root@1234!!"
    nicname  = "nic-prod"


    # Nested Blocks for Network Interface Configuration
    os_disk = {
      caching  = "ReadWrite"
      sgacount = "Standard_LRS"
    }

    # Nested Blocks for Network Interface Configuration

    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }
  }
}


# Assigning the value in the Bastion 
bastion-admin = {
  Bastin1 = {
    name                = "BastionServer"
    location            = "west us"
    rgname              = "ashish-rg"
    # Public Data Block Values 
    pname = "pip-dev"

    # Subnet Data Block Values 
    sname              = "AzureBastionSubnet"
    vnet = "vnet-prod"


    # Nested Block Values
    ip_configuration = {
      name = "configuration"
    }
  }
}

# Assigning the pip value here

pip-admin = {
  pip1 = {
    name                = "pip-dev"
    location            = "west us"
    resource_group_name = "ashish-rg"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}
