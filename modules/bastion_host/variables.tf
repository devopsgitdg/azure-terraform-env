

# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type        = string
  default     = "Ops"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "dev"
}

# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "dg_rg"
}

# Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  type        = string
  default     = "eastus2"
}

/* 
# Bastion Linux VM Input Variables Placeholder file.
variable "bastion_service_subnet_name" {
  description = "Bastion Service Subnet Name"
  default     = "AzureBastionSubnet"
}

variable "bastion_service_address_prefixes" {
  description = "Bastion Service Address Prefixes"
  default     = ["10.0.101.0/27"]
}
 */

# Bastion / Management Subnet Name
/* variable "bastion_subnet_name" {
  description = "Virtual Network Bastion Subnet Name"
  type = string
  default = "bastionsubnet"
} */
# Bastion / Management Subnet Address Space
/* variable "bastion_subnet_address" {
  description = "Virtual Network Bastion Subnet Address Spaces"
  type = list(string)
  default = ["10.0.100.0/24"]
} */


###########################################
#Network Variables 
###########################################

# Virtual Network, Subnets and Subnet NSG's

## Virtual Network
variable "virtual_network_name" {
  description = "Virtual Network name"
  type        = string
  /* default     = "dg-vnet-1" */
}

variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}


/* variable "virtual_network_name" {

  description = "The name of the resource group"
  type        = string

} */
/* 
# Web Subnet Name
variable "web_subnet_name" {
  description = "Virtual Network Web Subnet Name"
  type = string
  default = "websubnet"
}
# Web Subnet Address Space
variable "web_subnet_address" {
  description = "Virtual Network Web Subnet Address Spaces"
  type = list(string)
  default = ["10.0.1.0/24"]
}


# App Subnet Name
variable "app_subnet_name" {
  description = "Virtual Network App Subnet Name"
  type = string
  default = "appsubnet"
}
# App Subnet Address Space
variable "app_subnet_address" {
  description = "Virtual Network App Subnet Address Spaces"
  type = list(string)
  default = ["10.0.11.0/24"]
}


# Database Subnet Name
variable "db_subnet_name" {
  description = "Virtual Network Database Subnet Name"
  type = string
  default = "dbsubnet"
}
# Database Subnet Address Space
variable "db_subnet_address" {
  description = "Virtual Network Database Subnet Address Spaces"
  type = list(string)
  default = ["10.0.21.0/24"]
} */


# Bastion / Management Subnet Name
variable "subnet_name" {
  description = "Virtual Network Bastion Subnet Name"
  type        = string
 
} 

# Bastion / Management Subnet Address Space
/* variable "bastion_subnet_address" {
  description = "Virtual Network Bastion Subnet Address Spaces"
  type        = list(string)
  /* default     = ["10.0.100.0/24"] */
/* }  */


