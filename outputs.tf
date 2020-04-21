###
# Automation account
###

output "automation_account_id" {
  description = "ID of the automation account."
  value       = element(concat(azurerm_automation_account.this.*.id, list("")), 0)
}

###
# Automation account credentials
###

output "automation_account_credential_ids" {
  description = "IDs of the automation credentials."
  value       = compact(concat(azurerm_automation_credential.this.*.id, [""]))
}

###
# Automation account schedule
###

output "automation_schedule_ids" {
  description = "IDs of the automation schedules."
  value       = compact(concat(azurerm_automation_schedule.this.*.id, [""]))
}

###
# Automation account job schedule
###

output "automation_account_job_ids" {
  description = "Ids of the automation job schedule."
  value       = compact(concat(azurerm_automation_job_schedule.this.*.id, [""]))
}

output "automation_account_job_schedule_ids" {
  description = "The UUID identifying the automation job schedule."
  value       = compact(concat(azurerm_automation_job_schedule.this.*.job_schedule_id, [""]))
}

###
# Automation module
###

output "automation_module_ids" {
  description = "IDs of the automation module."
  value       = compact(concat(azurerm_automation_module.this_module.*.id, [""]))
}

###
# Automation account runbook
###

output "automation_account_runbook_ids" {
  description = "IDs of the automation account runbook."
  value       = compact(concat(azurerm_automation_runbook.this_runbook.*.id, [""]))
}

###
# Automation account variable bool
###

output "automation_account_var_bool_ids" {
  description = "IDs of the automation account account variable bool."
  value       = compact(concat(azurerm_automation_variable_bool.this_bool.*.id, [""]))
}

###
# Automation account variable datetime
###

output "automation_account_var_datetime_ids" {
  description = "Id of the automation acount variable date-time."
  value       = compact(concat(azurerm_automation_variable_datetime.this_datetime.*.id, [""]))
}

###
# Automation account variable int
###

output "automation_account_var_int_ids" {
  description = "Id of the automation acount variable int."
  value       = compact(concat(azurerm_automation_variable_int.this_int.*.id, [""]))
}

###
# Automation account variable string
###

output "automation_account_var_string_ids" {
  description = "Id of the automation acount variable string."
  value       = compact(concat(azurerm_automation_variable_string.this_string.*.id, [""]))
}

###
# Log analytics linked service
###

output "log_analytics_linked_service_id" {
  description = "the ID of the log analytics linked service."
  value       = element(concat(azurerm_log_analytics_linked_service.this.*.id, list("")), 0)
}
