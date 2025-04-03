resource "azurerm_mssql_server" "sqlserver" {
  name                         = "dbserver-${var.projectsolution2}-${var.envoirment}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = var.admin_sql_password
  tags                         = var.tags
}

resource "azurerm_mssql_database" "database" {
  name                = "database${var.projectsolution2}${var.envoirment}"
  server_id          = azurerm_mssql_server.sqlserver.id
  sku_name           = "S0"
    tags = var.tags
}