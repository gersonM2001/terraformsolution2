provider "azurerm" {
    subscription_id = var.suscription_id
    
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.projectsolution2}-${var.envoirment}"
  location = var.location


tags = var.tags
}

resource "azurerm_resource_group" "key_vault" {
  name     = "rg${var.projectsolution2}${var.envoirment}"
  location = var.location
  tags     = var.tags
}
