 


module "bastion_service"{

    source = "../modules/bastion"

    # resources
    location             = "eastus2"
    resource_group_name = "tfstate"
    virtual_network_name = "dg-vnets"
    subnet_name = "bas-subnet"
    publicip_name = "bastionip"

}
