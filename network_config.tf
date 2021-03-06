resource "azurerm_virtual_network" "vnet" {
  depends_on = [
    azurerm_resource_group.erik_k8s
  ]
  name                = "vnet-${var.resource_group_name}"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "k8s_subnet" {
  depends_on = [
    azurerm_resource_group.erik_k8s
  ]
  name                 = "snet-k8s-${var.resource_group_name}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.k8s_subnet_address_prefixes
}