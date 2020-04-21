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

data "local_file" "this_runbook" {
  filename = "${path.root}/runbook/example1.ps1"
}
module "example" {
  source = "../.."

  automation_account_enabled = true
  automation_account_name    = "tftest${random_string.this.result}"
  resource_group_name        = "${azurerm_resource_group.example.name}"
  location                   = "${azurerm_resource_group.example.location}"
  sku_name                   = "Basic"

  automation_credential_enabled = true
  credential_names              = ["tftest${random_string.this.result}", "tftesta${random_string.this.result}"]
  credential_usernames          = ["terraform"]
  credential_passwords          = ["test@${random_string.this.result}"]

  automation_schedule_enabled = true
  schedule_names              = ["tftest${random_string.this.result}", "tftesta${random_string.this.result}"]
  schedule_frequencies        = ["Week"]
  schedule_descriptions       = ["test"]
  schedule_intervals          = [1, 2]
  schedule_start_times        = ["2020-06-15T18:30:00Z", "2020-07-15T20:30:00Z"]
  schedule_expiry_times       = ["2020-06-15T20:30:00Z", "2020-07-15T23:30:00Z"]
  schedule_timezones          = ["UTC"]
  schedule_weekdays           = [["Monday", "Friday"], ["Monday", "Thursday"]]

  automation_variable_bool_enabled = true
  variable_bool_names              = ["tftest0${random_string.this.result}", "tftest1${random_string.this.result}"]
  variable_bool_descriptions       = ["Terraform test"]
  variable_bool_encryptions        = [false, true]
  variable_bool_values             = [false, true]

  automation_variable_datetime_enabled = true
  variable_datetime_names              = ["tftest2${random_string.this.result}", "tftest3${random_string.this.result}"]
  variable_datetime_descriptions       = ["Terraform test"]
  variable_datetime_encryptions        = [false, true]
  variable_datetime_values             = ["2020-06-24T21:40:54.074Z", "2020-07-24T23:40:54.074Z"]

  automation_variable_string_enabled = true
  variable_string_names              = ["tftest4${random_string.this.result}", "tftest5${random_string.this.result}"]
  variable_string_descriptions       = ["Terraform test"]
  variable_string_encryptions        = [false]
  variable_string_values             = ["Hello world!", "Terraform"]

  automation_variable_int_enabled = true
  variable_int_names              = ["tftest6${random_string.this.result}", "tftest7${random_string.this.result}"]
  variable_int_descriptions       = ["Terraform test"]
  variable_int_encryptions        = [false]
  variable_int_values             = [76453, 56473]

  module_enabled   = true
  module_names     = ["xActiveDirectory", "NetworkingDsc"]
  module_link_uris = ["https://devopsgallerystorage.blob.core.windows.net/packages/xactivedirectory.2.19.0.nupkg", "https://www.powershellgallery.com/api/v2/package/NetworkingDsc/7.3.0.0"]

  runbook_enabled           = true
  runbook_names             = ["tftest${random_string.this.result}", "tftest1${random_string.this.result}"]
  runbook_log_verbose       = [true]
  runbook_log_progress      = [true]
  runbook_types             = ["PowerShell"]
  runbook_descriptions      = ["This is test runbook"]
  runbook_contents          = ["${data.local_file.this.content}", "${data.local_file.this_runbook.content}"]
  publish_content_link_uris = ["https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1", "https://github.com/Azure/azure-quickstart-templates/blob/master/azure-resource-optimization-toolkit/scripts/AROToolkit_AutoUpdate.ps1"]
}
