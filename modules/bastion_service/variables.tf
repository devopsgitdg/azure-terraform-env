

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
  /* default     = "dev_dg_rg1" */
}

# Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  type        = string
  default     = "eastus2"
}




###########################################
#Network Variables 
###########################################

# Virtual Network, Subnets and Subnet NSG's

## Virtual Network
/* variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "dg-vnet-1"
} */

variable "virtual_network_name" {
  description = "The name of the resource group"
  type        = string

}


variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}


# Bastion Linux VM Input Variables Placeholder file.
variable "bastion_service_subnet_name" {
  description = "Bastion Service Subnet Name"
  default     = "AzureBastionSubnet"
}

variable "bastion_service_address_prefixes" {
  description = "Bastion Service Address Prefixes"
  default     = ["10.0.101.0/27"]
}

