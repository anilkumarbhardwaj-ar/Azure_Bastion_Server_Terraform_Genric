# adding the value in rg

module "modrg" {
  source = "../../Module/1.Rg"
  rg_map = var.rg-admin

}

# Adding the value in vnet 
module "modvnet" {
  depends_on = [module.modrg]
  source     = "../../Module/2.Vnet"
  vnet_map   = var.vnet-admin

}

# Adding the value in Subnet

module "modsub" {
  depends_on = [module.modvnet]
  source     = "../../Module/3.Subnet"
  sub_map    = var.sub-admin

}
# Adding the value in Nic

module "modnic" {
  depends_on = [module.modrg, module.modsub]
  source     = "../../Module/4.NIC"
  nic_map    = var.nic-admin
}

# Adding the value in VM

module "modvm" {
  depends_on = [module.modrg, module.modnic]
  source     = "../../Module/5.VM"
  vm_map     = var.vm-admin
}

# Adding the value in PIP

module "modpip" {
  depends_on = [module.modrg  ]
  source  = "../../Module/6.PIP"
  pip-map = var.pip-admin

}

# Adding the value in PIP

module "mod-bas" {
  depends_on = [ module.modrg,module.modsub,module.modpip ]
  source = "../../Module/7.Bastion"
  bastion-map = var.bastion-admin
  
}