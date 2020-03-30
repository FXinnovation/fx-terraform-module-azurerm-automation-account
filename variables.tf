###
# General
###

variable "enabled" {
  description = "Enable or diasble module."
  default     = true
}

variable "resource_group_name" {
  description = "Name of the resource group of the automation acount resources should be exist.Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "location" {
  description = "Specifies the supported Azure location where the resourceexists. Changing this forces a new resource to be created.If enabled value is `Required`."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags shared by all resources of this module. Will be merged with any other specific tags by resource."
  default     = {}
}

variable "automation_account_exist" {
  description = "Boolean flag which describes whether the automation account already exist to which credentials have to be created."
  default     = false
}

variable "existing_automation_account_names" {
  description = "List of names of the existing automation account names to which the credentials will be created. If `utomation_account_exist` is enabled then this value is `Required`."
  type        = list(string)
  default     = [""]
}

###
# Automation account
###

variable "automation_account_name" {
  description = "Specifies the name of the Automation Account. Changing this forces a new resource to be created. If enabled value is `Required`"
  type        = string
  default     = ""
}

variable "automation_account_sku_name" {
  description = "The SKU name of the account - only `Basic` is supported at this time."
  type        = string
  default     = "Basic"
}

variable "automation_account_tags" {
  description = "Tags which will be associated to the automation account"
  default     = {}
}

###
# Automation account credentials
###

variable "automation_credential_enabled" {
  description = "Boolean flag which describes whether to enable the automation crdentials resource or not."
  default     = false
}

variable "automation_credential_names" {
  description = "List of names of the Credential. Changing this forces a new resource to be created. If enabled this value is `Required`."
  type        = list(string)
  default     = [""]
}

variable "automation_account_credential_usernames" {
  description = "The list of usernames associated with this automation credentials."
  type        = list(string)
  default     = [""]
}

variable "automation_account_credential_passwords" {
  description = "the list of passowrds associated with this automation credentials."
  type        = list(string)
  default     = [""]
}

variable "automation_account_credential_descriptions" {
  description = "The list of descriptions associated with this automation account."
  type        = list(string)
  default     = [""]
}

###
# Automation account schedule
###

variable "automation_account_schedule_enabled" {
  description = "Boolean flag which describes whether or not enable the automation account schedule resource."
  default     = false
}

variable "automation_account_schedule_names" {
  description = "List which specifies the names of the schedule. Changing this forces a new resource to be created.If enabled value is `Required`."
  type        = list(string)
  default     = [""]
}

variable "automation_account_schedule_frequencies" {
  description = "Lis of  frequency of the schedule. - can be either `OneTime`, `Day`, `Hour`, `Week`, or `Month`.If enabled value id `Required`."
  type        = list(string)
  default     = ["Onetime"]
}

variable "automation_account_schedule_descriptions" {
  description = "The list of descriptions for this schedule."
  type        = list(string)
  default     = [""]
}

variable "automation_account_schedule_intervals" {
  description = "List of  number of frequencys between runs. Only valid when frequency is `Day`, `Hour`, `Week`, or `Month` and defaults to `1`."
  type        = list(number)
  default     = [1]
}

variable "automation_account_schedule_start_times" {
  description = "The list of start times of the schedule. Must be at least five minutes in the future. Defaults to seven minutes in the future from the time the resource is created."
  type        = list(string)
  default     = [""]
}

variable "automation_account_schedule_expiry_times" {
  description = "The list of end times of the schedule."
  type        = list(string)
  default     = []
}

variable "automation_account_schedule_timezones" {
  description = "List of timezone of the start times. Defaults to `UTC`. For possible values see: https://msdn.microsoft.com/en-us/library/ms912391(v=winembedded.11).aspx"
  type        = list(string)
  default     = ["UTC"]
}

variable "automation_account_schedule_weekdays" {
  description = "List of days of the week that the job should execute on. Only valid when frequency is `Week`."
  type        = list(list(string))
  default     = []
}

variable "automation_account_schedule_month_days" {
  description = " List of days of the month that the job should execute on. Must be between `1` and `31`. `-1` for last day of the month. Only valid when frequency is `Month`."
  type        = list(list(string))
  default     = []
}

variable "monthly_occurrence_day" {
  description = "List of day of the occurrence. Must be one of `Monday`, `Tuesday`, `Wednesday`, `Thursday`, `Friday`, `Saturday`, `Sunday`."
  type        = list(string)
  default     = [""]
}

variable "monthly_occurrences" {
  description = "List of occurrence of the week within the month. Must be between `1` and `5`. `-1` for last week within the month."
  type        = list(number)
  default     = [1]
}

###
# Automation account job schedule
###

variable "automation_account_job_enabled" {
  description = "Boolean flag which describes whether or not enable the automation job schedule resource."
  default     = false
}

variable "automation_account_job_schedule_names" {
  description = "List of names of the automation job schedules. Chaging this forces a new resource to be created. if enabled this value is `Required`."
  type        = list(string)
  default     = [""]
}

variable "automation_account_job_runbook_names" {
  description = "List of names of a runbook to link to a Schedule. It needs to be in the same automation account as the schedule and job schedule. Changing this forces a new resource to be created. If enabled this value is `Rquired`."
  type        = list(string)
  default     = [""]
}

variable "automation_account_job_parameters" {
  description = "List of key/value pairs corresponding to the arguments that can be passed to the runbook. `NOTE: The parameter keys/names must strictly be in lowercase, even if this is not the case in the runbook. This is due to a limitation in Azure automation where the parameter names are normalized. The values specified don't have this limitation.` Changing this forces a new resource to be created."
  type        = list(object({}))
  default     = []
}

variable "automation_account_job_run_on" {
  description = "List of names of ybrid worker group the runbook will be executed on. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

###
# Automation module
###

variable "automation_module_enabled" {
  description = "Boolean flag which describes whether or not enable the automation module resource."
  default     = false
}

variable "automation_module_names" {
  description = "The list which describes the names of the automation module. Changing this force a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "module_link_uri" {
  description = "The list of published module link uri of te module content (zip or nupkg).If enabled this value is `Required`."
  type        = list(string)
  default     = [""]
}

###
# Automation account runbook
###

variable "automation_account_runbook_enabled" {
  description = "Boolean flag which describes whether or not enable the automation runbook resource."
  default     = false
}

variable "automation_account_runbook_names" {
  description = "The list of names of the runbook . Changing this forces a new resource to be created. If enabled this value is `Required`."
  type        = list(string)
  default     = [""]
}

variable "automation_account_runbook_types" {
  description = "The list which describes the type of the runbook can be either `Graph`, `GraphPowerShell`, `GraphPowerShellWorkflow`, `PowerShellWorkflow`, `PowerShell` or `Script`. If enabled this value is `Required`."
  type        = list(string)
  default     = [""]
}

variable "automation_account_runbook_log_progress" {
  description = "The list of boolean flag which the whether to have log options or not. If enabled this value is `Required`."
  type        = list(bool)
  default     = [false]
}

variable "automation_account_runbook_log_verbose" {
  description = "The list of boolean flag which describes whether to have versbose log option or not. If enabled this value is `Required`."
  type        = list(bool)
  default     = [false]
}

variable "automation_account_runbook_descriptions" {
  description = "The list of descriptions which will be associated to the credentials."
  type        = list(string)
  default     = [""]
}

variable "automation_account_runbook_contents" {
  description = "The list of desired content of the runbook. `NOTE: The Azure API requires a `publish_content_link` to be supplied even when specifying your own `content` & setting `content` to an empty string will revert the runbook to the `publish_content_link`."
  type        = list(string)
  default     = [""]
}

variable "publish_content_link_uri" {
  description = "The list of uri of the runbook content. If enabled this value is `Required."
  type        = list(string)
  default     = [null]
}

variable "automation_account_runbook_tags" {
  description = "Thag which willl be associated to the automation account runbook resource."
  default     = {}
}

###
# Automation account variable bool
###

variable "automation_variable_bool_enabled" {
  description = "Boolean flag which describes whether or not to enable the resource."
  default     = false
}

variable "automation_account_variable_bool_names" {
  description = "List which specifies the names of automation bool variable. Changing this forces a new resource to be created. If enabled this value is `Required`."
  type        = list(string)
  default     = [""]
}

variable "automation_account_variable_bool_descriptions" {
  description = " List of description of the automation bool variable."
  type        = list(string)
  default     = [""]
}

variable "automation_account_variable_bool_encryptions" {
  description = "List which specifies if the automation bool variable is encrypted. Defaults to `false`."
  type        = list(bool)
  default     = [false]
}

variable "automation_account_variable_bool_values" {
  description = "The list of values of automation bool variable as `boolean`."
  type        = list(bool)
  default     = [false]
}

###
# Automation account variable datetime
###

variable "automation_variable_datetime_enabled" {
  description = "Boolean flag which describes whether or not to enable the resource."
  default     = false
}

variable "automation_account_variable_datetime_names" {
  description = "List which specifies the names of automation datetime variable. Changing this forces a new resource to be created. If enabled this value is `Required`."
  type        = list(string)
  default     = [""]
}

variable "automation_account_variable_datetime_descriptions" {
  description = " List of description of the automation datetime variable."
  type        = list(string)
  default     = [""]
}

variable "automation_account_variable_datetime_encryptions" {
  description = "List which specifies if the automation datetime variable is encrypted. Defaults to `false`."
  type        = list(bool)
  default     = [false]
}

variable "automation_account_variable_datetime_values" {
  description = "The list of values of automation datetime variable in the RFC3339 Section 5.6 Internet Date/Time Format. https://tools.ietf.org/html/rfc3339#section-5.6 "
  type        = list(string)
  default     = [""]
}

###
# Automation account variable int
###

variable "automation_variable_int_enabled" {
  description = "Boolean flag which describes whether or not to enable the resource."
  default     = false
}

variable "automation_account_variable_int_names" {
  description = "List which specifies the names of automation int variable. Changing this forces a new resource to be created. If enabled this value is `Required`."
  type        = list(string)
  default     = [""]
}

variable "automation_account_variable_int_descriptions" {
  description = " List of description of the automation int variable."
  type        = list(string)
  default     = [""]
}

variable "automation_account_variable_int_encryptions" {
  description = "List which specifies if the automation int variable is encrypted. Defaults to `false`."
  type        = list(bool)
  default     = [false]
}

variable "automation_account_variable_int_values" {
  description = "The list of values of automation int variable as `Integer`."
  type        = list(number)
  default     = [1234]
}

###
# Automation account variable string
###

variable "automation_variable_string_enabled" {
  description = "Boolean flag which describes whether or not to enable the resource."
  default     = false
}

variable "automation_account_variable_string_names" {
  description = "List which specifies the names of automation string variable. Changing this forces a new resource to be created. If enabled this value is `Required`."
  type        = list(string)
  default     = [""]
}

variable "automation_account_variable_string_descriptions" {
  description = " List of description of the automation string variable."
  type        = list(string)
  default     = [""]
}

variable "automation_account_variable_string_encryptions" {
  description = "List which specifies if the automation string variable is encrypted. Defaults to `false`."
  type        = list(bool)
  default     = [false]
}

variable "automation_account_variable_string_values" {
  description = "The list of values of automation string variable as `String`."
  type        = list(string)
  default     = ["Terraform"]
}
