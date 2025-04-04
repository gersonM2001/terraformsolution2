resource "azurerm_service_plan" "sp" {
  name                = "sp-${var.projectsolution2}-${var.envoirment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "B1"
  os_type             = "Linux"
  
}

resource "azurerm_linux_web_app" "webappui"{
    name                = "webappui-${var.projectsolution2}-${var.envoirment}"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id     = azurerm_service_plan.sp.id

    site_config {
        always_on = true
        application_stack {
            docker_registry_url = "https://index.docker.io"
            docker_image_name = "nginx:latest"
        }
    }
    app_settings = {
        WEBSITES_PORT = "80"
    }
}

resource "azurerm_linux_web_app" "webappapi"{
    name                = "webappapi-${var.projectsolution2}-${var.envoirment}"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id     = azurerm_service_plan.sp.id

    site_config {
        always_on = true
        application_stack {
            docker_registry_url = "https://index.docker.io"
            docker_image_name = "nginx:latest"
        }
    }
    app_settings = {
        WEBSITES_PORT = "80"
    }
}

resource "azurerm_log_analytics_workspace" "monitor" {
  name                = "law${var.projectsolution2}${var.envoirment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "PerGB2018"
}


resource "azurerm_monitor_diagnostic_setting" "monitor_ui" {
  name                       = "diagnostic-setting-webappui-${var.projectsolution2}-${var.envoirment}"
  target_resource_id         = azurerm_linux_web_app.webappui.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.monitor.id

  metric {
    category = "AllMetrics"
    enabled  = true
    
  }

  enabled_log {
    category = "AppServiceHTTPLogs"
  }
  
  enabled_log {
    category = "AppServiceConsoleLogs"
  }
  
  enabled_log {
    category = "AppServiceAppLogs"
  }
}


resource "azurerm_monitor_diagnostic_setting" "monitor_api" {
  name                       = "diagnostic-setting-webappapi-${var.projectsolution2}-${var.envoirment}"
  target_resource_id         = azurerm_linux_web_app.webappapi.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.monitor.id

  metric {
    category = "AllMetrics"
    enabled  = true
    
  }

  enabled_log {
    category = "AppServiceHTTPLogs"
  }
  
  enabled_log {
    category = "AppServiceConsoleLogs"
  }
  
  enabled_log {
    category = "AppServiceAppLogs"
  }
}