resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.sku
  admin_enabled       = false
}

