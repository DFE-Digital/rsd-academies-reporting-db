variable "environment" {
  description = "Environment name. Will be used along with `project_name` as a prefix for all resources."
  type        = string
}

variable "project_name" {
  description = "Project name. Will be used along with `environment` as a prefix for all resources."
  type        = string
}

variable "azure_location" {
  description = "Azure location in which to launch resources."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {}
}

variable "existing_resource_group" {
  description = "Conditionally launch resources into an existing resource group. Specifying this will NOT create a resource group."
  type        = string
  default     = ""
}

variable "launch_in_vnet" {
  description = "Conditionally launch into a VNet"
  type        = bool
  default     = true
}

variable "existing_virtual_network" {
  description = "Conditionally use an existing virtual network. The `virtual_network_address_space` must match an existing address space in the VNet. This also requires the resource group name."
  type        = string
  default     = ""
}

variable "virtual_network_address_space" {
  description = "Virtual Network address space CIDR"
  type        = string
  default     = "172.16.0.0/12"
}

variable "enable_mssql_database" {
  description = "Set to true to create an Azure SQL server/database, with a private endpoint within the virtual network"
  type        = bool
  default     = false
}

variable "mssql_server_admin_password" {
  description = "The local administrator password for the MSSQL server"
  type        = string
  default     = ""
  sensitive   = true
}

variable "mssql_azuread_admin_username" {
  description = "Username of a User within Azure AD that you want to assign as the SQL Server Administrator"
  type        = string
  default     = ""
}

variable "mssql_azuread_admin_object_id" {
  description = "Object ID of a User within Azure AD that you want to assign as the SQL Server Administrator"
  type        = string
  default     = ""
}

variable "mssql_azuread_auth_only" {
  description = "Set to true to only permit SQL logins from Azure AD users"
  type        = bool
  default     = false
}

variable "mssql_sku_name" {
  description = "Specifies the name of the SKU used by the database"
  type        = string
  default     = "Basic"
}

variable "mssql_collation" {
  description = "Set the collation for the SQL database"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "mssql_max_size_gb" {
  description = "The max size of the database in gigabytes"
  type        = number
  default     = 2
}

variable "mssql_database_name" {
  description = "The name of the MSSQL database to create. Must be set if `enable_mssql_database` is true"
  type        = string
  default     = ""
}

variable "mssql_firewall_ipv4_allow_list" {
  description = "A list of IPv4 Addresses that require remote access to the MSSQL Server"
  type = map(object({
    start_ip_range : string,
    end_ip_range : optional(string, "")
  }))
  default = {}
}

variable "mssql_server_public_access_enabled" {
  description = "Enable public internet access to your MSSQL instance. Be sure to specify 'mssql_firewall_ipv4_allow_list' to restrict inbound connections"
  type        = bool
  default     = false
}

variable "mssql_version" {
  description = "Specify the version of Microsoft SQL Server you want to run"
  type        = string
  default     = "12.0"
}

variable "enable_mssql_vulnerability_assessment" {
  description = "Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities"
  type        = bool
  default     = true
}

variable "mssql_security_storage_firewall_ipv4_allow_list" {
  description = "Additional IP addresses to add to the Storage Account that holds the Vulnerability Assessments"
  type        = list(string)
  default     = []
}

variable "mssql_managed_identity_assign_role" {
  description = "Assign the 'Storage Blob Data Contributor' Role to the SQL Server User-Assigned Managed Identity. Note: If you do not have 'Microsoft.Authorization/roleAssignments/write' permission, you will need to manually assign the 'Storage Blob Data Contributor' Role to the identity"
  type        = bool
  default     = false
}

variable "enable_monitoring" {
  description = "Create an App Insights instance and notification group for the Container App"
  type        = bool
  default     = false
}

variable "monitor_email_receivers" {
  description = "A list of email addresses that should be notified by monitoring alerts"
  type        = list(string)
  default     = []
}

variable "existing_logic_app_workflow" {
  description = "Name, Resource Group and HTTP Trigger URL of an existing Logic App Workflow. Leave empty to create a new Resource"
  type = object({
    name : string
    resource_group_name : string
  })
  default = {
    name                = ""
    resource_group_name = ""
  }
}

variable "key_vault_access_ipv4" {
  description = "List of IPv4 Addresses that are permitted to access the Key Vault"
  type        = list(string)
}

variable "tfvars_filename" {
  description = "tfvars filename. This file is uploaded and stored encrypted within Key Vault, to ensure that the latest tfvars are stored in a shared place."
  type        = string
}

variable "private_endpoint_configurations" {
  description = <<EOT
  Map of private endpoint configurations, specifying the VNet name/resource-group and a new subnet CIDR. A subnet, private endpoint and DNS zone will be created within the specified VNet.
  {
    endpoint-name = {
      vnet_name: The Name of the VNet to create the private endpoint resources
      vnet_resource_group_name: The Name of the resource group containing the VNet
      subnet_cidr: The CIDR of the Private Endpoint subnet to be created
      route_table_name: The Route Table ID to associate the subnet with (Optional)
    }
  }
  EOT
  type = map(object({
    vnet_name                       = string
    vnet_resource_group_name        = string
    subnet_cidr                     = string
    subnet_route_table_name         = optional(string, null)
    create_acr_privatelink_dns_zone = optional(bool, true)
  }))
  default = {}
}
