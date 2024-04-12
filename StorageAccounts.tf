# Create storage accounts
resource "azurerm_storage_account" "hot" {
  name                         = var.hot_storage_name
  resource_group_name          = azurerm_resource_group.rg-veeambackup.name
  location                     = azurerm_resource_group.rg-veeambackup.location
  account_tier                 = "Standard"
  account_replication_type     = "LRS"
  access_tier                  = "Hot"
  network_rules {
    default_action             = "Deny"
    ip_rules                   = [var.client_ip_address]
    virtual_network_subnet_ids = [azurerm_subnet.snet-vnet-veeambackup-01.id]
    bypass                     = ["AzureServices", "Logging", "Metrics"]
  }
  blob_properties {
    versioning_enabled         = true
  }
}

resource "azurerm_storage_account" "cool" {
  name                         = var.cool_storage_name
  resource_group_name          = azurerm_resource_group.rg-veeambackup.name
  location                     = azurerm_resource_group.rg-veeambackup.location
  account_tier                 = "Standard"
  account_replication_type     = "LRS"
  access_tier                  = "Cool"
  network_rules {
    default_action             = "Deny"
    ip_rules                   = [var.client_ip_address]
    virtual_network_subnet_ids = [azurerm_subnet.snet-vnet-veeambackup-01.id]
    bypass                     = ["AzureServices", "Logging", "Metrics"]
  }
  blob_properties {
    versioning_enabled         = true
  }
}
