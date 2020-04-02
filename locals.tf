locals {
  should_create_automation_module            = var.enabled && var.automation_module_enabled
  should_create_automation_runbook           = var.enabled && var.automation_account_runbook_enabled
  should_create_automation_account           = var.enabled && var.automation_account_enabled
  should_create_automation_schedule          = var.enabled && var.automation_account_schedule_enabled
  should_create_automation_credentials       = var.enabled && var.automation_credential_enabled
  should_create_automation_job_schedule      = var.enabled && var.automation_account_job_enabled
  should_create_automation_variable_int      = var.enabled && var.automation_variable_int_enabled
  should_create_automation_variable_bool     = var.enabled && var.automation_variable_bool_enabled
  should_create_automation_variable_string   = var.enabled && var.automation_variable_string_enabled
  should_create_automation_variable_datetime = var.enabled && var.automation_variable_datetime_enabled
}
