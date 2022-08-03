data "azurerm_subscription" "current" {}


 
resource "azurerm_policy_definition" "df_poldef" {
  name                = "only-deploy-in-eastus2"
  policy_type         = "Custom"
  mode                = "All"
  display_name        = "deploy only on east us"
 

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


resource "azurerm_subscription_policy_assignment" "dg_polsub" {
  name                 = "dg-polsub-assignment"
  policy_definition_id = azurerm_policy_definition.df_poldef.id
  subscription_id      = data.azurerm_subscription.current.id
}

 