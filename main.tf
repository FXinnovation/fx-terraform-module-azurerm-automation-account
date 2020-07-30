locals {
  should_create_automation_module            = var.enabled && var.module_enabled
  should_create_automation_runbook           = var.enabled && var.runbook_enabled
  should_create_automation_account           = var.enabled && var.automation_account_enabled
  should_create_automation_schedule          = var.enabled && var.automation_schedule_enabled
  should_create_automation_credentials       = var.enabled && var.automation_credential_enabled
  should_create_automation_job_schedule      = var.enabled && var.automation_job_enabled
  should_create_automation_variable_int      = var.enabled && var.automation_variable_int_enabled
  should_create_automation_variable_bool     = var.enabled && var.automation_variable_bool_enabled
  should_create_automation_variable_string   = var.enabled && var.automation_variable_string_enabled
  should_create_automation_variable_datetime = var.enabled && var.automation_variable_datetime_enabled
}

###
# Automation account
###

resource "azurerm_automation_account" "this" {
  count = local.should_create_automation_account ? 1 : 0

  name                = var.automation_account_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_name

  tags = merge(
    var.tags,
    var.automation_account_tags,
    {
      "Terraform" = "true"
    }
  )
}

###
# Automation account credentials
###

resource "azurerm_automation_credential" "this" {
  count = local.should_create_automation_credentials ? length(var.credential_names) : 0

  name                    = element(var.credential_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  username                = element(var.credential_usernames, count.index)
  password                = element(var.credential_passwords, count.index)
  description             = element(var.credential_descriptions, count.index)
}

###
# Automation account schedule
###

resource "azurerm_automation_schedule" "this" {
  count = local.should_create_automation_schedule ? length(var.schedule_names) : 0

  name                    = element(var.schedule_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  frequency               = element(var.schedule_frequencies, count.index)
  description             = element(var.schedule_descriptions, count.index)
  interval                = element(var.schedule_frequencies, count.index) != "OneTime" ? element(var.schedule_intervals, count.index) : null
  start_time              = element(var.schedule_start_times, count.index)
  expiry_time             = element(var.schedule_expiry_times, count.index)
  timezone                = element(var.schedule_timezones, count.index)
  week_days               = element(var.schedule_frequencies, count.index) == "Week" ? element(var.schedule_weekdays, count.index) : null
  month_days              = element(var.schedule_frequencies, count.index) == "Month" ? element(var.schedule_month_days, count.index) : null

  dynamic "monthly_occurrence" {
    for_each = element(var.schedule_frequencies, count.index) == "Month" ? [1] : []

    content {
      day        = element(var.monthly_occurrence_days, count.index)
      occurrence = element(var.monthly_occurrence_occurrences, count.index)
    }
  }

  depends_on = [azurerm_automation_account.this]
}

###
# Automation account job schedule
###

resource "azurerm_automation_job_schedule" "this" {
  count = local.should_create_automation_job_schedule ? length(var.automation_job_schedule_names) : 0

  schedule_name           = element(var.automation_job_schedule_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  runbook_name            = element(var.automation_job_schedule_runbook_names, count.index)
  parameters              = element(var.automation_job_schedule_parameters, count.index)
  run_on                  = element(var.automation_job_schedule_run_on, count.index)

  depends_on = [azurerm_automation_schedule.this,azurerm_automation_runbook.this_runbook]
}

###
# Automation module
###

resource "azurerm_automation_module" "this_module" {
  count = local.should_create_automation_module ? length(var.module_names) : 0

  name                    = element(var.module_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)

  dynamic "module_link" {
    for_each = element(var.module_link_uris, count.index) != null ? [1] : []

    content {
      uri = element(var.module_link_uris, count.index)
    }
  }
}

###
# Automation account runbook
###

resource "azurerm_automation_runbook" "this_runbook" {
  count = local.should_create_automation_runbook ? length(var.runbook_names) : 0

  name                    = element(var.runbook_names, count.index)
  resource_group_name     = var.resource_group_name
  location                = var.location
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  runbook_type            = element(var.runbook_types, count.index)
  log_progress            = element(var.runbook_log_progress, count.index)
  log_verbose             = element(var.runbook_log_verbose, count.index)
  description             = element(var.runbook_descriptions, count.index)
  content                 = element(var.runbook_contents, count.index)

  dynamic "publish_content_link" {
    for_each = element(var.publish_content_link_uris, count.index) != null ? [1] : []

    content {
      uri = element(var.publish_content_link_uris, count.index)
    }
  }

  tags = merge(
    var.tags,
    var.runbook_tags,
    {
      "Terraform" = "true"
    }
  )
}

###
# Automation account variable bool
###

resource "azurerm_automation_variable_bool" "this_bool" {
  count = local.should_create_automation_variable_bool ? length(var.variable_bool_names) : 0

  name                    = element(var.variable_bool_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  description             = element(var.variable_bool_descriptions, count.index)
  encrypted               = element(var.variable_bool_encryptions, count.index)
  value                   = element(var.variable_bool_values, count.index)
}

###
# Automation account variable datetime
###

resource "azurerm_automation_variable_datetime" "this_datetime" {
  count = local.should_create_automation_variable_datetime ? length(var.variable_datetime_names) : 0

  name                    = element(var.variable_datetime_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  description             = element(var.variable_datetime_descriptions, count.index)
  encrypted               = element(var.variable_datetime_encryptions, count.index)
  value                   = element(var.variable_datetime_values, count.index)
}

###
# Automation account variable int
###

resource "azurerm_automation_variable_int" "this_int" {
  count = local.should_create_automation_variable_int ? length(var.variable_int_names) : 0

  name                    = element(var.variable_int_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  description             = element(var.variable_int_descriptions, count.index)
  encrypted               = element(var.variable_int_encryptions, count.index)
  value                   = element(var.variable_int_values, count.index)
}

###
# Automation account variable string
###

resource "azurerm_automation_variable_string" "this_string" {
  count = local.should_create_automation_variable_string ? length(var.variable_string_names) : 0

  name                    = element(var.variable_string_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  description             = element(var.variable_string_descriptions, count.index)
  encrypted               = element(var.variable_string_encryptions, count.index)
  value                   = element(var.variable_string_values, count.index)
}

###
# Log analytics linked service
###

resource "azurerm_log_analytics_linked_service" "this" {
  count = var.enable_update_management ? 1 : 0

  resource_group_name = var.resource_group_name
  workspace_name      = var.log_analytics_workspace_name
  linked_service_name = "automation"
  resource_id         = element(concat(azurerm_automation_account.this.*.id, list("")), 0)
}

###
# Log analytics solution
###

resource "azurerm_log_analytics_solution" "this_solution" {
  count = var.enable_update_management ? 1 : 0

  resource_group_name   = var.resource_group_name
  location              = var.location
  solution_name         = "Updates"
  workspace_resource_id = var.log_analytics_workspace_id
  workspace_name        = var.log_analytics_workspace_name

  dynamic "plan" {
    for_each = var.log_analytics_workspace_id != "" ? [1] : []

    content {
      publisher = "Microsoft"
      product   = "OMSGallery/Updates"
    }
  }
}
