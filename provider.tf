terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.59.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.59.0"
    }

  }


}
provider "azurerm" {
  skip_provider_registration = true
  features {}
}