resource "azurerm_user_assigned_identity" "mssql" {
  count = local.enable_mssql_database ? 1 : 0

  location            = local.resource_group.location
  name                = "${local.resource_prefix}-uami-mssql"
  resource_group_name = local.resource_group.name
  tags                = local.tags
}

resource "azurerm_role_assignment" "mssql_storageblobdatacontributor" {
  count = local.enable_mssql_database && local.mssql_managed_identity_assign_role ? 1 : 0

  scope                = azurerm_storage_account.mssql_security_storage[0].id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.mssql[0].id
  description          = "Allow SQL Auditing to write reports and findings into the MSSQL Security Storage Account"
}
