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
