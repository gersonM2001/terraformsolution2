resource "azurerm_storage_account" "storageaccountsolution2" {
  name                     = "storage${var.projectsolution2}${var.envoirment}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_storage_container" "c1" {
  name                  = "imagenes"
  container_access_type = "private"
  storage_account_id = azurerm_storage_account.storageaccountsolution2.id
}



resource "azurerm_storage_queue" "q1" {
  name = "activacionesusuario"
  storage_account_name = azurerm_storage_account.storageaccountsolution2.name
}
