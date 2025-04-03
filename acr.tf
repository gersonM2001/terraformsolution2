resource "azurerm_container_registry" "acrsolution2" {
  name                = "acr${var.projectsolution2}${var.envoirment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
  tags                = var.tags
}