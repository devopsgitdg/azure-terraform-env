/* module "vm"{
    source = "./modules/vm" */

# resources
/*  
location             = "eastus2"
resource_group_name = "tfstate"
vm_size = "Standard_DS1"
vm_name = "linuxvm-2"
compute_name = "devlinux-vm1"
virtual_network_name = "acctvnet"
subnet_name = "subnetdg2"
publicip_name = "dev-publicip-2"
nic_name = "dev-vmnic1" */

/* } */


 /* module "bastion_service"{
    # resources
    source = "./modules/bastion_service"

 
   business_divsion        = "Ops"
   environment             = "dev"
   resource_group_name     = "dev_dg_rg1"
   resource_group_location = "eastus2"
   virtual_network_name    = "dg-vnet-1" 

}  */


/* module "bastion_host"{

source = "./modules/bastion_host"

business_divsion        = "Ops"
environment             = "dev"
resource_group_name     = "dg_rg"
resource_group_location = "eastus2"
virtual_network_name    = "dg-vnet-1"
subnet_name             = "dg-subnet-dev-1"

} */