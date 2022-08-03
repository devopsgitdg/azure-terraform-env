 
resource "azurerm_management_group" "dg_pol" {
  display_name = "dolgen-policy-gp"
}

resource "azurerm_policy_definition" "df_poldef" {
  name                = "only-deploy-in-eastus2"
  policy_type         = "Custom"
  mode                = "All"
  display_name        = "deploy only on east us"
  management_group_id = azurerm_management_group.dg_pol.id

  policy_rule = <<POLICY_RULE
    {
    "if": {
      "not": {
        "field": "location",
        "equals": "eastus2"
      }
    },
    "then": {
      "effect": "Deny"
    }
  }
POLICY_RULE
}


 

resource "azurerm_management_group_policy_assignment" "dg_pol_assig" {
  name                 = "dgassign-policy"
  policy_definition_id = azurerm_policy_definition.df_poldef.id
  management_group_id  = azurerm_management_group.dg_pol.id
}