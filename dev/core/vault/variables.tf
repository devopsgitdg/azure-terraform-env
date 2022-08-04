
variable "client_secret" {
    type = string
    default = "OKC8Q~cRMo~1N6KCVokyTD0~boPpGaJCi4ognbHm"

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