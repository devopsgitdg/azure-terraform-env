data "azurerm_resource_group" "dg_rg" {
  name = "dev_dg_rg1"

}

resource "azurerm_api_management" "dg_api" {
  name                = "dolgen-api"
  location            = data.azurerm_resource_group.dg_rg.location
  resource_group_name = data.azurerm_resource_group.dg_rg.name
  publisher_name      = "Dollar Gen"
  publisher_email     = "hugob@outlook.com"

  sku_name = "Developer_1"
}