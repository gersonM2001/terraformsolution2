resource "azurerm_key_vault" "key_vault" {
  name                        = "kv${var.projectsolution2}2v${var.envoirment}"  
  resource_group_name         = azurerm_resource_group.key_vault.name  
  location                    = var.location
  sku_name                    = "standard" 
  
  tenant_id                   = data.azurerm_client_config.current.tenant_id

 soft_delete_retention_days = 7

  
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy"
 
    ]
  }
}

data "azurerm_client_config" "current" {}
