# Creates Resource Group
resource "azurerm_resource_group" "rg-veeambackup" {
  name     = "rg-veeambackup"
  location = "East US"
}

# Create Network Security Group
resource "azurerm_network_security_group" "nsg-snet-veeambackup-01" {
  name                = "nsg-snet-veeambackup-01"
  location            = "East US"
  resource_group_name = azurerm_resource_group.rg-veeambackup.name
}
# Allows datacenter traffic
resource "azurerm_network_security_rule" "AllowCidrBlockHTTPSInbound" {
  name                        = "AllowCidrBlockHTTPSInbound"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = [var.datacenter_ip_address, var.client_ip_address]
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-veeambackup.name
  network_security_group_name = azurerm_network_security_group.nsg-snet-veeambackup-01.name
}

# Create Virtual Network
resource "azurerm_virtual_network" "vnet-veeambackup-01" {
  name                = "vnet-veeambackup-01"
  address_space       = var.client_address_space
  location            = azurerm_resource_group.rg-veeambackup.location
  resource_group_name = azurerm_resource_group.rg-veeambackup.name
}
resource "azurerm_subnet" "snet-vnet-veeambackup-01" {
  name                      = "snet-vnet-veeambackup-01"
  virtual_network_name      = azurerm_virtual_network.vnet-veeambackup-01.name
  resource_group_name       = azurerm_resource_group.rg-veeambackup.name
  address_prefixes          = var.client_address_space
  service_endpoints         = ["Microsoft.Storage", "Microsoft.ServiceBus"]
}
resource "azurerm_subnet_network_security_group_association" "snet_nsg_ascociation" {
  subnet_id                 = azurerm_subnet.snet-vnet-veeambackup-01.id
  network_security_group_id = azurerm_network_security_group.nsg-snet-veeambackup-01.id
}
