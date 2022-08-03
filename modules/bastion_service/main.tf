 

 
data "azurerm_resource_group" "dg_rg" {
  name = "dev_dg_rg1"

}

data "azurerm_virtual_network" "vnet_name" {
  name = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.dg_rg.name
}


resource "azurerm_subnet" "bastion_service_subnet" {
  name                 = var.bastion_service_subnet_name
  resource_group_name  = data.azurerm_resource_group.dg_rg.name
  virtual_network_name = data.azurerm_virtual_network.vnet_name.name
  address_prefixes     = var.bastion_service_address_prefixes
}

resource "azurerm_public_ip" "bastion_service_publicip" {
  name                = "${local.resource_name_prefix}-bastion-service-publicip"
  location            = data.azurerm_resource_group.dg_rg.location
  resource_group_name = data.azurerm_resource_group.dg_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}


# Resource-3: Azure Bastion Service Host - is not a mistake that the resource azurerm_bastion_host
resource "azurerm_bastion_host" "bastion_host" {
  name                = "${local.resource_name_prefix}-bastion-service"
  location            = data.azurerm_resource_group.dg_rg.location
  resource_group_name = data.azurerm_resource_group.dg_rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_service_subnet.id
    public_ip_address_id = azurerm_public_ip.bastion_service_publicip.id
  }
}