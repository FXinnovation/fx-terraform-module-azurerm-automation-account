###
# Automation account
###

resource "azurerm_automation_account" "this" {
  count = var.enabled ? 1 : 0

  name                = var.automation_account_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.automation_account_sku_name

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
  count = var.enabled && var.automation_credential_enabled ? length(var.automation_credential_names) : 0

  name                    = element(var.automation_credential_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  username                = element(var.automation_account_credential_usernames, count.index)
  password                = element(var.automation_account_credential_passwords, count.index)
  description             = element(var.automation_account_credential_descriptions, count.index)
}

###
# Automation account schedule
###

resource "azurerm_automation_schedule" "this" {
  count = var.enabled && var.automation_account_schedule_enabled ? length(var.automation_account_schedule_names) : 0

  name                    = element(var.automation_account_schedule_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  frequency               = element(var.automation_account_schedule_frequencies, count.index)
  description             = element(var.automation_account_schedule_descriptions, count.index)
  interval                = element(var.automation_account_schedule_frequencies, count.index) != "OneTime" ? element(var.automation_account_schedule_intervals, count.index) : null
  start_time              = element(var.automation_account_schedule_start_times, count.index)
  expiry_time             = element(var.automation_account_schedule_expiry_times, count.index)
  timezone                = element(var.automation_account_schedule_timezones, count.index)
  week_days               = element(var.automation_account_schedule_frequencies, count.index) == "Week" ? element(var.automation_account_schedule_weekdays, count.index) : null
  month_days              = element(var.automation_account_schedule_frequencies, count.index) == "Month" ? element(var.automation_account_schedule_month_days, count.index) : null

  dynamic "monthly_occurrence" {
    for_each = element(var.automation_account_schedule_frequencies, count.index) == "Month" ? [1] : []

    content {
      day        = element(var.monthly_occurrence_day, count.index)
      occurrence = element(var.monthly_occurrences, count.index)
    }
  }

  depends_on = [azurerm_automation_account.this]
}

###
# Automation account job schedule
###

resource "azurerm_automation_job_schedule" "this" {
  count = var.enabled && var.automation_account_job_enabled ? length(var.automation_account_job_schedule_names) : 0

  schedule_name           = element(var.automation_account_job_schedule_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  runbook_name            = element(var.automation_account_job_runbook_names, count.index)
  parameters              = element(var.automation_account_job_parameters, count.index)
  run_on                  = element(var.automation_account_job_run_on, count.index)
}

###
# Automation module
###

resource "azurerm_automation_module" "this_module" {
  count = var.enabled && var.automation_module_enabled ? length(var.automation_module_names) : 0

  name                    = element(var.automation_module_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)

  dynamic "module_link" {
    for_each = element(var.module_link_uri, count.index) != null ? [1] : []

    content {
      uri = element(var.module_link_uri, count.index)
    }
  }
}

###
# Automation account runbook
###

resource "azurerm_automation_runbook" "this_runbook" {
  count = var.enabled && var.automation_account_runbook_enabled ? length(var.automation_account_runbook_names) : 0

  name                = element(var.automation_account_runbook_names, count.index)
  resource_group_name = var.resource_group_name
  location            = var.location
  account_name        = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  runbook_type        = element(var.automation_account_runbook_types, count.index)
  log_progress        = element(var.automation_account_runbook_log_progress, count.index)
  log_verbose         = element(var.automation_account_runbook_log_verbose, count.index)
  description         = element(var.automation_account_runbook_descriptions, count.index)
  content             = element(var.automation_account_runbook_contents, count.index)

  dynamic "publish_content_link" {
    for_each = element(var.publish_content_link_uri, count.index) != null ? [1] : []

    content {
      uri = element(var.publish_content_link_uri, count.index)
    }
  }

  tags = merge(
    var.tags,
    var.automation_account_runbook_tags,
    {
      "Terraform" = "true"
    }
  )
}

###
# Automation account variable bool
###

resource "azurerm_automation_variable_bool" "this_bool" {
  count = var.enabled && var.automation_variable_bool_enabled ? length(var.automation_account_variable_bool_names) : 0

  name                    = element(var.automation_account_variable_bool_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  description             = element(var.automation_account_variable_bool_descriptions, count.index)
  encrypted               = element(var.automation_account_variable_bool_encryptions, count.index)
  value                   = element(var.automation_account_variable_bool_values, count.index)
}

###
# Automation account variable datetime
###

resource "azurerm_automation_variable_datetime" "this_datetime" {
  count = var.enabled && var.automation_variable_datetime_enabled ? length(var.automation_account_variable_datetime_names) : 0

  name                    = element(var.automation_account_variable_datetime_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  description             = element(var.automation_account_variable_datetime_descriptions, count.index)
  encrypted               = element(var.automation_account_variable_datetime_encryptions, count.index)
  value                   = element(var.automation_account_variable_datetime_values, count.index)
}

###
# Automation account variable int
###

resource "azurerm_automation_variable_int" "this_int" {
  count = var.enabled && var.automation_variable_int_enabled ? length(var.automation_account_variable_int_names) : 0

  name                    = element(var.automation_account_variable_int_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  description             = element(var.automation_account_variable_int_descriptions, count.index)
  encrypted               = element(var.automation_account_variable_int_encryptions, count.index)
  value                   = element(var.automation_account_variable_int_values, count.index)
}

###
# Automation account variable string
###

resource "azurerm_automation_variable_string" "this_string" {
  count = var.enabled && var.automation_variable_string_enabled ? length(var.automation_account_variable_string_names) : 0

  name                    = element(var.automation_account_variable_string_names, count.index)
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_exist == false ? element(concat(azurerm_automation_account.this.*.name, list("")), 0) : element(var.existing_automation_account_names, count.index)
  description             = element(var.automation_account_variable_string_descriptions, count.index)
  encrypted               = element(var.automation_account_variable_string_encryptions, count.index)
  value                   = element(var.automation_account_variable_string_values, count.index)
}
