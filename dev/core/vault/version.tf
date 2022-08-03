

# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.3.0" # Optional but recommended in production
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  
  /* client_id       = "80af20ef-f7ec-4897-a1b2-21dc92321c9d"
  client_secret   = var.client_secret
  subscription_id = "4b859b53-281d-4b35-9887-9b7a17015e78"
  tenant_id       = "e394c503-ceb8-4916-a9b1-70c7369fbc36" */
  }

  skip_provider_registration = true
}


resource "random_string" "dg_random" {
  length  = 3
  upper   = false
  special = false

}