locals {
  # Global options
  environment     = var.environment
  project_name    = var.project_name
  resource_prefix = "${local.environment}${local.project_name}"
  azure_location  = var.azure_location
  tags            = var.tags

  # Key Vault
  key_vault_access_ipv4 = var.key_vault_access_ipv4
  tfvars_filename       = var.tfvars_filename

  # Resource Group
  existing_resource_group = var.existing_resource_group
  resource_group          = local.existing_resource_group == "" ? azurerm_resource_group.default[0] : data.azurerm_resource_group.existing_resource_group[0]

  # Networking
  private_endpoint_configurations     = var.private_endpoint_configurations
  adf_private_endpoint_configurations = var.adf_private_endpoint_configurations

  # SQL Server
  enable_mssql_database                           = var.enable_mssql_database
  mssql_server_admin_password                     = var.mssql_server_admin_password
  mssql_sku_name                                  = var.mssql_sku_name
  mssql_collation                                 = var.mssql_collation
  mssql_max_size_gb                               = var.mssql_max_size_gb
  mssql_database_name                             = var.mssql_database_name
  mssql_firewall_ipv4_allow_list                  = var.mssql_firewall_ipv4_allow_list
  mssql_azuread_admin_username                    = var.mssql_azuread_admin_username
  mssql_azuread_admin_object_id                   = var.mssql_azuread_admin_object_id
  mssql_azuread_auth_only                         = var.mssql_azuread_auth_only
  mssql_version                                   = var.mssql_version
  mssql_server_public_access_enabled              = var.mssql_server_public_access_enabled
  enable_mssql_vulnerability_assessment           = var.enable_mssql_vulnerability_assessment
  mssql_security_storage_firewall_ipv4_allow_list = var.mssql_security_storage_firewall_ipv4_allow_list
  mssql_managed_identity_assign_role              = var.mssql_managed_identity_assign_role

  # Azure Monitor
  enable_monitoring = var.enable_monitoring
  # Azure Monitor / Logic App Workflow
  existing_logic_app_workflow     = var.existing_logic_app_workflow
  logic_app_workflow_name         = local.existing_logic_app_workflow.name != "" ? data.azurerm_logic_app_workflow.existing_logic_app_workflow[0].name : null
  logic_app_workflow_id           = local.existing_logic_app_workflow.name != "" ? data.azurerm_logic_app_workflow.existing_logic_app_workflow[0].id : null
  logic_app_workflow_callback_url = local.existing_logic_app_workflow.name != "" ? jsondecode(data.azapi_resource_action.existing_logic_app_workflow_callback_url[0].output).value : null
  monitor_email_receivers         = var.monitor_email_receivers
  monitor_logic_app_receiver = {
    name         = local.logic_app_workflow_name
    resource_id  = local.logic_app_workflow_id
    callback_url = local.logic_app_workflow_callback_url
  }
}
