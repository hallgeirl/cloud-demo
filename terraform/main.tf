provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
    name = "hallgeirtf"
    location = "norwayeast"
}

resource "azurerm_app_service_plan" "example" {
  name                = "hallgeirtf-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "hallgeirtf-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}