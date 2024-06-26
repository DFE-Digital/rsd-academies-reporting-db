data "azurerm_resource_group" "existing_resource_group" {
  count = local.existing_resource_group == "" ? 0 : 1

  name = local.existing_resource_group
}

data "azurerm_subscription" "current" {}

data "azurerm_logic_app_workflow" "existing_logic_app_workflow" {
  count = local.existing_logic_app_workflow.name == "" ? 0 : 1

  name                = local.existing_logic_app_workflow.name
  resource_group_name = local.existing_logic_app_workflow.resource_group_name
}

# There is not currently a way to get the full HTTP Trigger callback URL from a Logic App
# so we have to use AzAPI to query the Logic App Workflow for the value instead.
# https://github.com/hashicorp/terraform-provider-azurerm/issues/18866
data "azapi_resource_action" "existing_logic_app_workflow_callback_url" {
  count = local.existing_logic_app_workflow.name == "" ? 0 : 1

  resource_id = "${data.azurerm_logic_app_workflow.existing_logic_app_workflow[0].id}/triggers/${data.azurerm_logic_app_workflow.existing_logic_app_workflow[0].name}-trigger"
  action      = "listCallbackUrl"
  type        = "Microsoft.Logic/workflows/triggers@2018-07-01-preview"

  depends_on = [
    data.azurerm_logic_app_workflow.existing_logic_app_workflow[0]
  ]

  response_export_values = ["value"]
}

data "azurerm_virtual_network" "private_endpoints" {
  for_each = local.private_endpoint_configurations

  name                = each.value["vnet_name"]
  resource_group_name = each.value["vnet_resource_group_name"]
}

data "azurerm_route_table" "private_endpoints" {
  for_each = {
    for k, v in local.private_endpoint_configurations : k => v if v["subnet_route_table_name"] != null
  }

  name                = each.value["subnet_route_table_name"]
  resource_group_name = each.value["vnet_resource_group_name"]
}
