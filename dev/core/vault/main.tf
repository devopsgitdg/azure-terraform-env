data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "dg_rg" {
  name = "dev_dg_rg1"

}


resource "azurerm_key_vault" "dg_vault" {
  name                        = "dg-vault-${random_string.dg_random.id}"
  location                    = data.azurerm_resource_group.dg_rg.location
  resource_group_name         = data.azurerm_resource_group.dg_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "List",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}


resource "azurerm_key_vault_secret" "dg_secret" {
  name         = "dg-trial-sct"
  value        = base64encode(file("sct_file"))
  key_vault_id = azurerm_key_vault.dg_vault.id
}