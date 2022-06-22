# Create Virtual Network
data "azurerm_virtual_network" "dg-vnets" {
  name                = var.virtual_network_name
  /* address_space       = ["10.0.0.0/16"] */
  /* location            = azurerm_resource_group.dg_rg.location */
  resource_group_name = data.azurerm_resource_group.dg_rg
}

# Create Subnet
data "azurerm_subnet" "dg-subnet-devs" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.dg_rg.name
  virtual_network_name = data.azurerm_virtual_network.dg-vnets.name
  /* address_prefixes     = ["10.0.2.0/24"] */
}

# Create Public IP Address
resource "azurerm_public_ip" "dev-publicips" {
  name                = var.publicip_name
  resource_group_name = data.azurerm_resource_group.dg_rg.name
  location            = data.azurerm_resource_group.dg_rg.location
  allocation_method   = "Static"
  domain_name_label = "app1-vm-${random_string.dg_random.id}"
  tags = {
    environment = "Dev"
  }
}

# Create Network Interface
resource "azurerm_network_interface" "dg-vmnics" {
  name                = var.nic_name
  location            = data.azurerm_resource_group.dg_rg.location
  resource_group_name = data.azurerm_resource_group.dg_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.dg-subnet-devs.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.dev-publicips.id 
  }
}
