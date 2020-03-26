###
# Automation account
###

resource "azurerm_automation_account" "this" {
  count = var.enabled ? 1 : 0

  name                = var.automation_account_name
  resource_group_name = var.resource_group_name
  location            = var.automation_account_location
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
  description             = element(var.automation_account_credential_description, count.index)
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
  weekdays                = lement(var.automation_account_schedule_frequencies, count.index) == "Week" ? element(var.automation_account_schedule_weekdays, count.index) : null
  month_days              = element(var.automation_account_schedule_frequencies, count.index) == "Month" ? element(var.automation_account_schedule_month_days, count.index) : null

  dynamic "monthly_occurrence" {
    for_each = element(var.automation_account_schedule_frequencies, count.index) == "Month"

    content {
      day        = element(var.monthly_occurrence_day, count.index)
      occurrence = element(var.monthly_occurrences, count.index)
    }
  }

  depends_on = [azurerm_automation_account.this]
}
