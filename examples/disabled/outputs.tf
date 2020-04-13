output "automation_account_id" {
  description = "ID of the automation account."
  value       = module.example.automation_account_id
}

output "automation_account_credential_ids" {
  description = "IDs of the automation credentials."
  value       = module.example.automation_account_credential_ids
}

output "automation_schedule_ids" {
  description = "IDs of the automation schedules."
  value       = module.example.automation_schedule_ids
}

output "automation_job_ids" {
  description = "Ids of the automation job schedule."
  value       = module.example.automation_account_job_ids
}

output "automation_module_ids" {
  description = "IDs of the automation module."
  value       = module.example.automation_module_ids
}

output "automation_account_runbook_ids" {
  description = "IDs of the automation account runbook."
  value       = module.example.automation_account_runbook_ids
}

output "automation_variable_bool_ids" {
  description = "IDs of the automation account account variable bool."
  value       = module.example.automation_account_var_bool_ids
}

output "automation_variable_datetime_ids" {
  description = "Id of the automation acount variable date-time."
  value       = module.example.automation_account_var_datetime_ids
}

output "automation_variable_int_ids" {
  description = "Id of the automation acount variable int."
  value       = module.example.automation_account_var_int_ids
}

output "automation_variable_string_ids" {
  description = "Id of the automation acount variable string."
  value       = module.example.automation_account_var_string_ids
}
