# adding the value in rg (Creating two RG)

variable "rg-admin" {
  type = map(any) # denoted the map because of {} and ---------- List []
}


# Adding the value in vnet (Creating two Vnet)

variable "vnet-admin" {

}

# Adding the value in vnet (Creating two Subnet)

variable "sub-admin" {
}


# Adding the value in NIc 

variable "nic-admin" {
}

# Adding the value in vm

variable "vm-admin" {

}
# Adding the value in bastion

variable "bastion-admin" {

}

# Adding the value in bastion

variable "pip-admin" {

}