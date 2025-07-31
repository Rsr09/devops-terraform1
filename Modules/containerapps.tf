
resource "azurerm_container_app_environment" "containerappsenv" {
  name                       = "${var.container_appsenv_name}${var.env}"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
}

resource "azurerm_container_app" "containrapps" {
  name                         = "${var.container_apps_name}${var.env}"
  container_app_environment_id = azurerm_container_app_environment.containerappsenv.id
  resource_group_name          = azurerm_resource_group.rg.name
  revision_mode                = "Single"

  template {
    container {
      name   = "container1"
      image  = "mcr.microsoft.com/k8se/quickstart:latest"
      cpu    = var.containerappscpu
      memory = var.containerappsmemory
    }
  }
}