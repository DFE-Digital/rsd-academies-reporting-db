<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >= 1.12.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.99.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 1.12.1 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.99.0 |

## Resources

| Name | Type |
|------|------|
| [azapi_update_resource.mssql_threat_protection](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/update_resource) | resource |
| [azapi_update_resource.mssql_vulnerability_assessment](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/update_resource) | resource |
| [azurerm_monitor_action_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_monitor_metric_alert.sql_cpu](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.sql_dataio](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.sql_deadlock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.sql_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.sql_failed_system](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.sql_failed_user](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.sql_rate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.sql_tempdb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.sql_user_cpu](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.sql_worker](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_mssql_database.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |
| [azurerm_mssql_database_extended_auditing_policy.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database_extended_auditing_policy) | resource |
| [azurerm_mssql_firewall_rule.default_mssql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_server.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server_extended_auditing_policy.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_private_dns_zone.mssql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.mssql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.mssql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_resource_group.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.mssql_storageblobdatacontributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_storage_account.mssql_security_storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_network_rules.mssql_security_storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |
| [azurerm_storage_container.mssql_security_storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_subnet.mssql_private_endpoint_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_route_table_association.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_user_assigned_identity.mssql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_virtual_network.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azapi_resource_action.existing_logic_app_workflow_callback_url](https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/resource_action) | data source |
| [azurerm_logic_app_workflow.existing_logic_app_workflow](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/logic_app_workflow) | data source |
| [azurerm_resource_group.existing_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_route_table.private_endpoints](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/route_table) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [azurerm_virtual_network.existing_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.private_endpoints](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_location"></a> [azure\_location](#input\_azure\_location) | Azure location in which to launch resources. | `string` | n/a | yes |
| <a name="input_enable_monitoring"></a> [enable\_monitoring](#input\_enable\_monitoring) | Create an App Insights instance and notification group for the Container App | `bool` | `false` | no |
| <a name="input_enable_mssql_database"></a> [enable\_mssql\_database](#input\_enable\_mssql\_database) | Set to true to create an Azure SQL server/database, with a private endpoint within the virtual network | `bool` | `false` | no |
| <a name="input_enable_mssql_vulnerability_assessment"></a> [enable\_mssql\_vulnerability\_assessment](#input\_enable\_mssql\_vulnerability\_assessment) | Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name. Will be used along with `project_name` as a prefix for all resources. | `string` | n/a | yes |
| <a name="input_existing_logic_app_workflow"></a> [existing\_logic\_app\_workflow](#input\_existing\_logic\_app\_workflow) | Name, Resource Group and HTTP Trigger URL of an existing Logic App Workflow. Leave empty to create a new Resource | <pre>object({<br>    name : string<br>    resource_group_name : string<br>  })</pre> | <pre>{<br>  "name": "",<br>  "resource_group_name": ""<br>}</pre> | no |
| <a name="input_existing_resource_group"></a> [existing\_resource\_group](#input\_existing\_resource\_group) | Conditionally launch resources into an existing resource group. Specifying this will NOT create a resource group. | `string` | `""` | no |
| <a name="input_existing_virtual_network"></a> [existing\_virtual\_network](#input\_existing\_virtual\_network) | Conditionally use an existing virtual network. The `virtual_network_address_space` must match an existing address space in the VNet. This also requires the resource group name. | `string` | `""` | no |
| <a name="input_key_vault_access_ipv4"></a> [key\_vault\_access\_ipv4](#input\_key\_vault\_access\_ipv4) | List of IPv4 Addresses that are permitted to access the Key Vault | `list(string)` | n/a | yes |
| <a name="input_launch_in_vnet"></a> [launch\_in\_vnet](#input\_launch\_in\_vnet) | Conditionally launch into a VNet | `bool` | `true` | no |
| <a name="input_monitor_email_receivers"></a> [monitor\_email\_receivers](#input\_monitor\_email\_receivers) | A list of email addresses that should be notified by monitoring alerts | `list(string)` | `[]` | no |
| <a name="input_mssql_azuread_admin_object_id"></a> [mssql\_azuread\_admin\_object\_id](#input\_mssql\_azuread\_admin\_object\_id) | Object ID of a User within Azure AD that you want to assign as the SQL Server Administrator | `string` | `""` | no |
| <a name="input_mssql_azuread_admin_username"></a> [mssql\_azuread\_admin\_username](#input\_mssql\_azuread\_admin\_username) | Username of a User within Azure AD that you want to assign as the SQL Server Administrator | `string` | `""` | no |
| <a name="input_mssql_azuread_auth_only"></a> [mssql\_azuread\_auth\_only](#input\_mssql\_azuread\_auth\_only) | Set to true to only permit SQL logins from Azure AD users | `bool` | `false` | no |
| <a name="input_mssql_collation"></a> [mssql\_collation](#input\_mssql\_collation) | Set the collation for the SQL database | `string` | `"SQL_Latin1_General_CP1_CI_AS"` | no |
| <a name="input_mssql_database_name"></a> [mssql\_database\_name](#input\_mssql\_database\_name) | The name of the MSSQL database to create. Must be set if `enable_mssql_database` is true | `string` | `""` | no |
| <a name="input_mssql_firewall_ipv4_allow_list"></a> [mssql\_firewall\_ipv4\_allow\_list](#input\_mssql\_firewall\_ipv4\_allow\_list) | A list of IPv4 Addresses that require remote access to the MSSQL Server | <pre>map(object({<br>    start_ip_range : string,<br>    end_ip_range : optional(string, "")<br>  }))</pre> | `{}` | no |
| <a name="input_mssql_managed_identity_assign_role"></a> [mssql\_managed\_identity\_assign\_role](#input\_mssql\_managed\_identity\_assign\_role) | Assign the 'Storage Blob Data Contributor' Role to the SQL Server User-Assigned Managed Identity. Note: If you do not have 'Microsoft.Authorization/roleAssignments/write' permission, you will need to manually assign the 'Storage Blob Data Contributor' Role to the identity | `bool` | `true` | no |
| <a name="input_mssql_max_size_gb"></a> [mssql\_max\_size\_gb](#input\_mssql\_max\_size\_gb) | The max size of the database in gigabytes | `number` | `2` | no |
| <a name="input_mssql_security_storage_firewall_ipv4_allow_list"></a> [mssql\_security\_storage\_firewall\_ipv4\_allow\_list](#input\_mssql\_security\_storage\_firewall\_ipv4\_allow\_list) | Additional IP addresses to add to the Storage Account that holds the Vulnerability Assessments | `list(string)` | `[]` | no |
| <a name="input_mssql_server_admin_password"></a> [mssql\_server\_admin\_password](#input\_mssql\_server\_admin\_password) | The local administrator password for the MSSQL server | `string` | `""` | no |
| <a name="input_mssql_server_public_access_enabled"></a> [mssql\_server\_public\_access\_enabled](#input\_mssql\_server\_public\_access\_enabled) | Enable public internet access to your MSSQL instance. Be sure to specify 'mssql\_firewall\_ipv4\_allow\_list' to restrict inbound connections | `bool` | `false` | no |
| <a name="input_mssql_sku_name"></a> [mssql\_sku\_name](#input\_mssql\_sku\_name) | Specifies the name of the SKU used by the database | `string` | `"Basic"` | no |
| <a name="input_mssql_version"></a> [mssql\_version](#input\_mssql\_version) | Specify the version of Microsoft SQL Server you want to run | `string` | `"12.0"` | no |
| <a name="input_private_endpoint_configurations"></a> [private\_endpoint\_configurations](#input\_private\_endpoint\_configurations) | Map of private endpoint configurations, specifying the VNet name/resource-group and a new subnet CIDR. A subnet, private endpoint and DNS zone will be created within the specified VNet.<br>  {<br>    endpoint-name = {<br>      vnet\_name: The Name of the VNet to create the private endpoint resources<br>      vnet\_resource\_group\_name: The Name of the resource group containing the VNet<br>      subnet\_cidr: The CIDR of the Private Endpoint subnet to be created<br>      route\_table\_name: The Route Table ID to associate the subnet with (Optional)<br>    }<br>  } | <pre>map(object({<br>    vnet_name                       = string<br>    vnet_resource_group_name        = string<br>    subnet_cidr                     = string<br>    subnet_route_table_name         = optional(string, null)<br>    create_acr_privatelink_dns_zone = optional(bool, true)<br>  }))</pre> | `{}` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name. Will be used along with `environment` as a prefix for all resources. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to all resources | `map(string)` | `{}` | no |
| <a name="input_tfvars_filename"></a> [tfvars\_filename](#input\_tfvars\_filename) | tfvars filename. This file is uploaded and stored encrypted within Key Vault, to ensure that the latest tfvars are stored in a shared place. | `string` | n/a | yes |
| <a name="input_virtual_network_address_space"></a> [virtual\_network\_address\_space](#input\_virtual\_network\_address\_space) | Virtual Network address space CIDR | `string` | `"172.16.0.0/12"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_resource_group"></a> [azurerm\_resource\_group](#output\_azurerm\_resource\_group) | Azure Resource Group |
| <a name="output_azurerm_user_assigned_identity_principal_id"></a> [azurerm\_user\_assigned\_identity\_principal\_id](#output\_azurerm\_user\_assigned\_identity\_principal\_id) | Principal ID for the UAMI assigned to the SQL Server |
<!-- END_TF_DOCS -->