resource "azurerm_storage_account" "mssql_security_storage" {
  count = local.enable_mssql_database ? 1 : 0

  name                            = "${replace(local.resource_prefix, "-", "")}mssqlsec"
  resource_group_name             = local.resource_group.name
  location                        = local.resource_group.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  min_tls_version                 = "TLS1_2"
  tags                            = local.tags
  enable_https_traffic_only       = true
  public_network_access_enabled   = local.enable_mssql_vulnerability_assessment ? true : false
  shared_access_key_enabled       = true
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account_network_rules" "mssql_security_storage" {
  count = local.enable_mssql_database ? 1 : 0

  storage_account_id = azurerm_storage_account.mssql_security_storage[0].id
  # If Vulnerability Assessment is enabled, then there is not currently a way to
  # store reports in a Storage Account that is protected by a Firewall.
  # Inbound traffic must be permitted to the Storage Account
  default_action             = local.enable_mssql_vulnerability_assessment ? "Allow" : "Deny"
  bypass                     = ["AzureServices"]
  virtual_network_subnet_ids = []
  ip_rules                   = local.mssql_security_storage_firewall_ipv4_allow_list
}

resource "azurerm_storage_container" "mssql_security_storage" {
  count = local.enable_mssql_database ? 1 : 0

  name                 = "${local.resource_prefix}-mssqlsec"
  storage_account_name = azurerm_storage_account.mssql_security_storage[0].name
}
