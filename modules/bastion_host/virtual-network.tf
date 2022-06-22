# Azure Bastion
# Pull Virtual Network
data "azurerm_virtual_network" "dg-vnets" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.dg_rg.name
}


data "azurerm_subnet" "dg-subnet-devs" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.dg_rg.name
  virtual_network_name = data.azurerm_virtual_network.dg-vnets.name
  /* address_prefixes     = ["10.0.2.0/24"] */
}




resource "azurerm_public_ip" "bastion_host_publicip" {
  name                = "${local.resource_name_prefix}-bastion-host-publicip"
  location            = data.azurerm_resource_group.dg_rg.location
  resource_group_name = data.azurerm_resource_group.dg_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_network_interface" "bastion_host_linuxvm_nic" {
  name                = "${local.resource_name_prefix}-bastion-host-linuxvm-nic"
  location            = data.azurerm_resource_group.dg_rg.location
  resource_group_name = data.azurerm_resource_group.dg_rg.name

  ip_configuration {
    name                          = "bastion-host-ip-1"
    subnet_id                     = data.azurerm_subnet.dg-subnet-devs.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastion_host_publicip.id
  }
}

