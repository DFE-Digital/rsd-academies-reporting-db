output "azurerm_resource_group" {
  value       = local.existing_resource_group == "" ? azurerm_resource_group.default[0] : null
  description = "Azure Resource Group"
}

output "azurerm_user_assigned_identity_principal_id" {
  value       = azurerm_user_assigned_identity.mssql[0].principal_id
  description = "Principal ID for the UAMI assigned to the SQL Server"
}
