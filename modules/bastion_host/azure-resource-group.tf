

# Resource-1: Azure Resource Group
/* resource "azurerm_resource_group" "rg" {

  name     = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.dg_random.id}"
  location = var.resource_group_location
  tags     = local.common_tags
} */

data "azurerm_resource_group" "dg_rg" {
  name = "dev_dg_rg1"

}
