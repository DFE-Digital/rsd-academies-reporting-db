resource "azurerm_monitor_action_group" "main" {
  count = local.enable_monitoring ? 1 : 0

  name                = "${local.resource_prefix}-actiongroup"
  resource_group_name = local.resource_group.name
  short_name          = local.project_name
  tags                = local.tags

  dynamic "email_receiver" {
    for_each = local.monitor_email_receivers

    content {
      name                    = "Email ${email_receiver.value}"
      email_address           = email_receiver.value
      use_common_alert_schema = true
    }
  }

  dynamic "logic_app_receiver" {
    for_each = local.existing_logic_app_workflow.name != "" ? [1] : []

    content {
      name                    = local.monitor_logic_app_receiver.name
      resource_id             = local.monitor_logic_app_receiver.resource_id
      callback_url            = local.monitor_logic_app_receiver.callback_url
      use_common_alert_schema = true
    }
  }
}

resource "azurerm_monitor_metric_alert" "sql_user_cpu" {
  count = local.enable_monitoring && local.enable_mssql_database ? 1 : 0

  name                = "${local.resource_prefix}-sql-user-cpu"
  resource_group_name = local.resource_group.name
  scopes              = [azurerm_mssql_database.default[0].id]
  description         = "High user CPU usage"
  window_size         = "PT15M"
  frequency           = "PT1M"
  severity            = 2

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "cpu_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90
  }

  action {
    action_group_id = azurerm_monitor_action_group.main[0].id
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "sql_cpu" {
  count = local.enable_monitoring && local.enable_mssql_database ? 1 : 0

  name                = "${local.resource_prefix}-sql-cpu"
  resource_group_name = local.resource_group.name
  scopes              = [azurerm_mssql_database.default[0].id]
  description         = "High total CPU usage"
  window_size         = "PT15M"
  frequency           = "PT1M"
  severity            = 2

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "sql_instance_cpu_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90
  }

  action {
    action_group_id = azurerm_monitor_action_group.main[0].id
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "sql_worker" {
  count = local.enable_monitoring && local.enable_mssql_database ? 1 : 0

  name                = "${local.resource_prefix}-sql-worker"
  resource_group_name = local.resource_group.name
  scopes              = [azurerm_mssql_database.default[0].id]
  description         = "High worker usage"
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = 1

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "workers_percent"
    aggregation      = "Minimum"
    operator         = "GreaterThan"
    threshold        = 60
  }

  action {
    action_group_id = azurerm_monitor_action_group.main[0].id
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "sql_dataio" {
  count = local.enable_monitoring && local.enable_mssql_database ? 1 : 0

  name                = "${local.resource_prefix}-sql-worker"
  resource_group_name = local.resource_group.name
  scopes              = [azurerm_mssql_database.default[0].id]
  description         = "High data IO usage"
  window_size         = "PT15M"
  frequency           = "PT1M"
  severity            = 3

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "physical_data_read_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90
  }

  action {
    action_group_id = azurerm_monitor_action_group.main[0].id
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "sql_disk" {
  count = local.enable_monitoring && local.enable_mssql_database ? 1 : 0

  name                = "${local.resource_prefix}-sql-disk"
  resource_group_name = local.resource_group.name
  scopes              = [azurerm_mssql_database.default[0].id]
  description         = "Low data space"
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = 1

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "storage_percent"
    aggregation      = "Minimum"
    operator         = "GreaterThan"
    threshold        = 95
  }

  action {
    action_group_id = azurerm_monitor_action_group.main[0].id
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "sql_tempdb" {
  count = local.enable_monitoring && local.enable_mssql_database ? 1 : 0

  name                = "${local.resource_prefix}-sql-tempdb"
  resource_group_name = local.resource_group.name
  scopes              = [azurerm_mssql_database.default[0].id]
  description         = "Low tempdb log space"
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = 1

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "tempdb_log_used_percent"
    aggregation      = "Minimum"
    operator         = "GreaterThan"
    threshold        = 60
  }

  action {
    action_group_id = azurerm_monitor_action_group.main[0].id
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "sql_deadlock" {
  count = local.enable_monitoring && local.enable_mssql_database ? 1 : 0

  name                = "${local.resource_prefix}-sql-deadlock"
  resource_group_name = local.resource_group.name
  scopes              = [azurerm_mssql_database.default[0].id]
  description         = "Deadlocks"
  window_size         = "PT1H"
  frequency           = "PT15M"
  severity            = 3

  dynamic_criteria {
    metric_namespace  = "Microsoft.Sql/servers/databases"
    metric_name       = "deadlock"
    aggregation       = "Total"
    operator          = "GreaterThan"
    alert_sensitivity = "Medium"
  }

  action {
    action_group_id = azurerm_monitor_action_group.main[0].id
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "sql_failed_user" {
  count = local.enable_monitoring && local.enable_mssql_database ? 1 : 0

  name                = "${local.resource_prefix}-sql-failed-user"
  resource_group_name = local.resource_group.name
  scopes              = [azurerm_mssql_database.default[0].id]
  description         = "Failed connections (user errors)"
  window_size         = "PT5M"
  frequency           = "PT15M"
  severity            = 2

  dynamic_criteria {
    metric_namespace  = "Microsoft.Sql/servers/databases"
    metric_name       = "connection_failed_user_error"
    aggregation       = "Total"
    operator          = "GreaterThan"
    alert_sensitivity = "Medium"
  }

  action {
    action_group_id = azurerm_monitor_action_group.main[0].id
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "sql_failed_system" {
  count = local.enable_monitoring && local.enable_mssql_database ? 1 : 0

  name                = "${local.resource_prefix}-sql-failed-system"
  resource_group_name = local.resource_group.name
  scopes              = [azurerm_mssql_database.default[0].id]
  description         = "Failed connections (system errors)"
  window_size         = "PT5M"
  frequency           = "PT1M"
  severity            = 2

  criteria {
    metric_namespace = "Microsoft.Sql/servers/databases"
    metric_name      = "connection_failed_system_error"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 10
  }

  action {
    action_group_id = azurerm_monitor_action_group.main[0].id
  }

  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "sql_rate" {
  count = local.enable_monitoring && local.enable_mssql_database ? 1 : 0

  name                = "${local.resource_prefix}-sql-rate"
  resource_group_name = local.resource_group.name
  scopes              = [azurerm_mssql_database.default[0].id]
  description         = "Anomalous connection rate"
  window_size         = "PT15M"
  frequency           = "PT5M"
  severity            = 2

  dynamic_criteria {
    metric_namespace  = "Microsoft.Sql/servers/databases"
    metric_name       = "connection_failed_system_error"
    aggregation       = "Total"
    operator          = "GreaterOrLessThan"
    alert_sensitivity = "Low"
  }

  action {
    action_group_id = azurerm_monitor_action_group.main[0].id
  }

  tags = local.tags
}
