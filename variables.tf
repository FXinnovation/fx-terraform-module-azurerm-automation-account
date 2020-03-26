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

variable "automation_account_location" {
  description = "Specifies the supported Azure location where the resourceexists. Changing this forces a new resource to be created.If enabled value is `Required`."
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
