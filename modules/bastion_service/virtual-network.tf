# Azure Bastion
# Pull Virtual Network
data "azurerm_virtual_network" "dg-vnets" {
  name = var.virtual_network_name
  /* address_space       = var.vnet_address_space */
  /* location            = azurerm_resource_group.dg_rg.location */
  resource_group_name = data.azurerm_resource_group.dg_rg.name
}


resource "azurerm_subnet" "bastion_service_subnet" {
  name                 = var.bastion_service_subnet_name
  resource_group_name  = data.azurerm_resource_group.dg_rg.name
  virtual_network_name = data.azurerm_virtual_network.dg-vnets.name
  address_prefixes     = var.bastion_service_address_prefixes
}

resource "azurerm_public_ip" "bastion_service_publicip" {
  name                = "${local.resource_name_prefix}-bastion-service-publicip"
  location            = data.azurerm_resource_group.dg_rg.location
  resource_group_name = data.azurerm_resource_group.dg_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

 
# Resource-1: Create Bastion / Management Subnet
/* resource "azurerm_subnet" "bastionsubnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.bastion_subnet_name}"  
  resource_group_name  = azurerm_resource_group.dg_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.bastion_subnet_address
} */

# Resource-2: Create Network Security Group (NSG)
/* resource "azurerm_network_security_group" "bastion_subnet_nsg" {
  name                = "${azurerm_subnet.bastionsubnet.name}-nsg"
  location            = azurerm_resource_group.dg_rg.location
  resource_group_name = azurerm_resource_group.dg_rg.name
} */

# Resource-3: Associate NSG and Subnet
/* resource "azurerm_subnet_network_security_group_association" "bastion_subnet_nsg_associate" {
  depends_on = [ azurerm_network_security_rule.bastion_nsg_rule_inbound]    
  subnet_id                 = azurerm_subnet.bastionsubnet.id
  network_security_group_id = azurerm_network_security_group.bastion_subnet_nsg.id
} */

# Resource-4: Create NSG Rules
## Locals Block for Security Rules
/* locals {
  bastion_inbound_ports_map = {
    "100" : "22", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "3389"
  } 
} */
## NSG Inbound Rule for Bastion / Management Subnets
/* resource "azurerm_network_security_rule" "bastion_nsg_rule_inbound" {
  for_each = local.bastion_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value 
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.dg_rg.name
  network_security_group_name = azurerm_network_security_group.bastion_subnet_nsg.name
}
 */