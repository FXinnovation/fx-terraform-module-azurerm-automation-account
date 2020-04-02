resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "example" {
  name     = "example${random_string.this.result}"
  location = "West Europe"
}

module "example" {
  source = "../.."

  automation_account_enabled  = true
  automation_account_name     = "tftest${random_string.this.result}"
  resource_group_name         = "${azurerm_resource_group.example.name}"
  location                    = "${azurerm_resource_group.example.location}"
  automation_account_sku_name = "Basic"

  automation_credential_enabled           = true
  automation_credential_names             = ["tftest${random_string.this.result}"]
  automation_account_credential_usernames = ["terraform"]
  automation_account_credential_passwords = ["test@${random_string.this.result}"]

  automation_account_schedule_enabled      = true
  automation_account_schedule_names        = ["tftest${random_string.this.result}"]
  automation_account_schedule_frequencies  = ["Week"]
  automation_account_schedule_descriptions = ["test"]
  automation_account_schedule_intervals    = [1]
  automation_account_schedule_start_times  = ["2020-04-15T18:30:00.00Z"]
  automation_account_schedule_timezones    = ["UTC"]
  automation_account_schedule_weekdays     = [["Monday", "Friday"]]

  automation_variable_bool_enabled              = true
  automation_account_variable_bool_names        = ["tftest${random_string.this.result}"]
  automation_account_variable_bool_descriptions = ["Terraform test"]
  automation_account_variable_bool_encryptions  = [false]
  automation_account_variable_bool_values       = [false]

  automation_variable_datetime_enabled              = true
  automation_account_variable_datetime_names        = ["tftes${random_string.this.result}"]
  automation_account_variable_datetime_descriptions = ["Terraform test"]
  automation_account_variable_datetime_encryptions  = [false]
  automation_account_variable_datetime_values       = ["2020-05-24T21:40:54.074Z"]

  automation_variable_string_enabled              = true
  automation_account_variable_string_names        = ["tftst${random_string.this.result}"]
  automation_account_variable_string_descriptions = ["Terraform test"]
  automation_account_variable_string_encryptions  = [false]
  automation_account_variable_string_values       = ["Hello world!"]

  automation_variable_int_enabled              = true
  automation_account_variable_int_names        = ["tftesta${random_string.this.result}"]
  automation_account_variable_int_descriptions = ["Terraform test"]
  automation_account_variable_int_encryptions  = [false]
  automation_account_variable_int_values       = [76453]
}
