resource "azurerm_subnet" "private_endpoint" {
  for_each = local.private_endpoint_configurations

  name                                      = "${local.resource_prefix}-${each.key}-mssqlprivateendpoint"
  virtual_network_name                      = data.azurerm_virtual_network.private_endpoints[each.key].name
  resource_group_name                       = data.azurerm_virtual_network.private_endpoints[each.key].resource_group_name
  address_prefixes                          = [each.value["subnet_cidr"]]
  private_endpoint_network_policies_enabled = false
}

resource "azurerm_subnet_route_table_association" "private_endpoint" {
  for_each = {
    for k, v in local.private_endpoint_configurations : k => v if v["subnet_route_table_name"] != null
  }

  subnet_id      = azurerm_subnet.private_endpoint[each.key].id
  route_table_id = data.azurerm_route_table.private_endpoints[each.key].id
}

resource "azurerm_data_factory_managed_private_endpoint" "mssql" {
  for_each = local.adf_private_endpoint_configurations

  name               = "${local.resource_prefix}-mssql.${each.key}"
  data_factory_id    = each.value
  target_resource_id = azurerm_mssql_server.default[0].id
  subresource_name   = "sqlServer"
  fqdns              = ["${azurerm_mssql_server.default[0].name}.database.windows.net"]
}

resource "azurerm_private_endpoint" "mssql" {
  for_each = local.private_endpoint_configurations

  name                = "${local.resource_prefix}-mssql.${azurerm_subnet.private_endpoint[each.key].name}"
  location            = data.azurerm_virtual_network.private_endpoints[each.key].location
  resource_group_name = local.resource_group.name
  subnet_id           = azurerm_subnet.private_endpoint[each.key].id

  custom_network_interface_name = "${local.resource_prefix}${each.key}-nic"

  private_service_connection {
    name                           = "${local.resource_prefix}${each.key}"
    private_connection_resource_id = azurerm_mssql_server.default[0].id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "${local.resource_prefix}${each.key}-mssql-private-link"
    private_dns_zone_ids = [azurerm_private_dns_zone.mssql[each.key].id]
  }

  tags = local.tags
}

resource "azurerm_private_dns_zone" "mssql" {
  for_each = {
    for k, v in local.private_endpoint_configurations : k => v if v["create_mssql_privatelink_dns_zone"]
  }

  name                = "${azurerm_mssql_server.default[0].name}.database.windows.net"
  resource_group_name = data.azurerm_virtual_network.private_endpoints[each.key].resource_group_name
  tags                = local.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "mssql" {
  for_each = local.private_endpoint_configurations

  name                  = "${local.resource_prefix}mssqlprivatelink"
  resource_group_name   = data.azurerm_virtual_network.private_endpoints[each.key].resource_group_name
  private_dns_zone_name = each.value["create_mssql_privatelink_dns_zone"] ? azurerm_private_dns_zone.mssql[each.key].name : "privatelink.database.windows.net"
  virtual_network_id    = data.azurerm_virtual_network.private_endpoints[each.key].id
  tags                  = local.tags
}
