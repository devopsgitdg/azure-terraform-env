

module "bastion_host"{

source = "../../../modules/bastion_host"

business_divsion        = "Ops"
environment             = "dev"
resource_group_name     = "dg_rg"
resource_group_location = "eastus2"
virtual_network_name    = "dg-vnet-1"
subnet_name             = "dg-subnet-dev-1"

}