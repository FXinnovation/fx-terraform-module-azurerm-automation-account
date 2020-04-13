resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "example" {
  name     = "example${random_string.this.result}"
  location = "West Europe"
}

data "local_file" "this" {
  filename = "${path.root}/runbook/example.ps1"
}

module "example" {
  source = "../.."

  automation_account_enabled = true
  automation_account_name    = "tftest${random_string.this.result}"
  resource_group_name        = "${azurerm_resource_group.example.name}"
  location                   = "${azurerm_resource_group.example.location}"
  sku_name                   = "Basic"

  automation_credential_enabled = true
  credential_names              = ["tftest${random_string.this.result}"]
  credential_usernames          = ["terraform"]
  credential_passwords          = ["test@${random_string.this.result}"]

  automation_schedule_enabled = true
  schedule_names              = ["tftest${random_string.this.result}"]
  schedule_frequencies        = ["Week"]
  schedule_descriptions       = ["test"]
  schedule_intervals          = [1]
  schedule_start_times        = ["2020-04-15T18:30:00Z"]
  schedule_expiry_times       = ["2020-04-15T20:30:00Z"]
  schedule_timezones          = ["UTC"]
  schedule_weekdays           = [["Monday", "Friday"]]

  automation_variable_bool_enabled = true
  variable_bool_names              = ["tftesta${random_string.this.result}"]
  variable_bool_descriptions       = ["Terraform test"]
  variable_bool_encryptions        = [false]
  variable_bool_values             = [false]

  automation_variable_datetime_enabled = true
  variable_datetime_names              = ["tftestb${random_string.this.result}"]
  variable_datetime_descriptions       = ["Terraform test"]
  variable_datetime_encryptions        = [false]
  variable_datetime_values             = ["2020-05-24T21:40:54.074Z"]

  automation_variable_string_enabled = true
  variable_string_names              = ["tftestc${random_string.this.result}"]
  variable_string_descriptions       = ["Terraform test"]
  variable_string_encryptions        = [false]
  variable_string_values             = ["Hello world!"]

  automation_variable_int_enabled = true
  variable_int_names              = ["tftestd${random_string.this.result}4"]
  variable_int_descriptions       = ["Terraform test"]
  variable_int_encryptions        = [false]
  variable_int_values             = [76453]

  module_enabled   = true
  module_names     = ["xActiveDirectory"]
  module_link_uris = ["https://devopsgallerystorage.blob.core.windows.net/packages/xactivedirectory.2.19.0.nupkg"]

  runbook_enabled           = true
  runbook_names             = ["tftest${random_string.this.result}"]
  runbook_log_verbose       = [true]
  runbook_log_progress      = [true]
  runbook_types             = ["PowerShell"]
  runbook_descriptions      = ["This is test runbook"]
  runbook_contents          = ["${data.local_file.this.content}"]
  publish_content_link_uris = ["https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"]
}
