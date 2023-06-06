resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.sku
  admin_enabled       = false
}

resource "azurerm_azuread_application" "acr-app" {
  name = var.application_name
}

resource "azurerm_azuread_service_principal" "acr-sp" {
  application_id = azurerm_azuread_application.acr-app.application_id
}

resource "azurerm_azuread_service_principal_password" "acr-sp-pass" {
  service_principal_id = azurerm_azuread_service_principal.acr-sp.id
  value                = var.service_principal_password
}

resource "azurerm_role_assignment" "acr-assignment" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_azuread_service_principal_password.acr-sp-pass.service_principal_id
}
