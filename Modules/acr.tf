resource "azurerm_container_registry" "acr" {
  name                = "${var.acrname}${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.acr_tier
  admin_enabled       = true # or false
}
