# terraform-module-azurerm-automation-account

## Usage
See `examples` folders for usage of this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| automation\_account\_credential\_descriptions | The list of descriptions associated with this automation account. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_credential\_passwords | the list of passowrds associated with this automation credentials. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_credential\_usernames | The list of usernames associated with this automation credentials. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_enabled | Boolean flga whoch describes whether or not enable the automation account resource. | `bool` | `false` | no |
| automation\_account\_exist | Boolean flag which describes whether the automation account already exist to which credentials have to be created. | `bool` | `false` | no |
| automation\_account\_job\_enabled | Boolean flag which describes whether or not enable the automation job schedule resource. | `bool` | `false` | no |
| automation\_account\_job\_parameters | List of key/value pairs corresponding to the arguments that can be passed to the runbook. `NOTE: The parameter keys/names must strictly be in lowercase, even if this is not the case in the runbook. This is due to a limitation in Azure automation where the parameter names are normalized. The values specified don't have this limitation.` Changing this forces a new resource to be created. | `list(object({}))` | `[]` | no |
| automation\_account\_job\_run\_on | List of names of ybrid worker group the runbook will be executed on. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_job\_runbook\_names | List of names of a runbook to link to a Schedule. It needs to be in the same automation account as the schedule and job schedule. Changing this forces a new resource to be created. If enabled this value is `Rquired`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_job\_schedule\_names | List of names of the automation job schedules. Chaging this forces a new resource to be created. if enabled this value is `Required`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_name | Specifies the name of the Automation Account. Changing this forces a new resource to be created. If enabled value is `Required` | `string` | `""` | no |
| automation\_account\_runbook\_contents | The list of desired content of the runbook. `NOTE: The Azure API requires a `publish\_content\_link` to be supplied even when specifying your own `content` & setting `content` to an empty string will revert the runbook to the `publish\_content\_link`.` | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_runbook\_descriptions | The list of descriptions which will be associated to the credentials. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_runbook\_enabled | Boolean flag which describes whether or not enable the automation runbook resource. | `bool` | `false` | no |
| automation\_account\_runbook\_log\_progress | The list of boolean flag which the whether to have log options or not. If enabled this value is `Required`. | `list(bool)` | <pre>[<br>  false<br>]</pre> | no |
| automation\_account\_runbook\_log\_verbose | The list of boolean flag which describes whether to have versbose log option or not. If enabled this value is `Required`. | `list(bool)` | <pre>[<br>  false<br>]</pre> | no |
| automation\_account\_runbook\_names | The list of names of the runbook . Changing this forces a new resource to be created. If enabled this value is `Required`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_runbook\_tags | Thag which willl be associated to the automation account runbook resource. | `map` | `{}` | no |
| automation\_account\_runbook\_types | The list which describes the type of the runbook can be either `Graph`, `GraphPowerShell`, `GraphPowerShellWorkflow`, `PowerShellWorkflow`, `PowerShell` or `Script`. If enabled this value is `Required`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_schedule\_descriptions | The list of descriptions for this schedule. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_schedule\_enabled | Boolean flag which describes whether or not enable the automation account schedule resource. | `bool` | `false` | no |
| automation\_account\_schedule\_expiry\_times | The list of end times of the schedule. | `list(string)` | <pre>[<br>  "2022-12-31T20:30:00.00Z"<br>]</pre> | no |
| automation\_account\_schedule\_frequencies | Lis of  frequency of the schedule. - can be either `OneTime`, `Day`, `Hour`, `Week`, or `Month`.If enabled value id `Required`. | `list(string)` | <pre>[<br>  "Onetime"<br>]</pre> | no |
| automation\_account\_schedule\_intervals | List of  number of frequencys between runs. Only valid when frequency is `Day`, `Hour`, `Week`, or `Month` and defaults to `1`. | `list(number)` | <pre>[<br>  1<br>]</pre> | no |
| automation\_account\_schedule\_month\_days | List of days of the month that the job should execute on. Must be between `1` and `31`. `-1` for last day of the month. Only valid when frequency is `Month`. | `list(list(string))` | `[]` | no |
| automation\_account\_schedule\_names | List which specifies the names of the schedule. Changing this forces a new resource to be created.If enabled value is `Required`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_schedule\_start\_times | The list of start times of the schedule. Must be at least five minutes in the future. Defaults to seven minutes in the future from the time the resource is created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_schedule\_timezones | List of timezone of the start times. Defaults to `UTC`. For possible values see: https://msdn.microsoft.com/en-us/library/ms912391(v=winembedded.11).aspx | `list(string)` | <pre>[<br>  "UTC"<br>]</pre> | no |
| automation\_account\_schedule\_weekdays | List of days of the week that the job should execute on. Only valid when frequency is `Week`. | `list(list(string))` | `[]` | no |
| automation\_account\_sku\_name | The SKU name of the account - only `Basic` is supported at this time. | `string` | `"Basic"` | no |
| automation\_account\_tags | Tags which will be associated to the automation account | `map` | `{}` | no |
| automation\_account\_variable\_bool\_descriptions | List of description of the automation bool variable. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_variable\_bool\_encryptions | List which specifies if the automation bool variable is encrypted. Defaults to `false`. | `list(bool)` | <pre>[<br>  false<br>]</pre> | no |
| automation\_account\_variable\_bool\_names | List which specifies the names of automation bool variable. Changing this forces a new resource to be created. If enabled this value is `Required`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_variable\_bool\_values | The list of values of automation bool variable as `boolean`. | `list(bool)` | <pre>[<br>  false<br>]</pre> | no |
| automation\_account\_variable\_datetime\_descriptions | List of description of the automation datetime variable. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_variable\_datetime\_encryptions | List which specifies if the automation datetime variable is encrypted. Defaults to `false`. | `list(bool)` | <pre>[<br>  false<br>]</pre> | no |
| automation\_account\_variable\_datetime\_names | List which specifies the names of automation datetime variable. Changing this forces a new resource to be created. If enabled this value is `Required`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_variable\_datetime\_values | The list of values of automation datetime variable in the RFC3339 Section 5.6 Internet Date/Time Format. https://tools.ietf.org/html/rfc3339#section-5.6 | `list(string)` | <pre>[<br>  "2019-04-24T21:40:54.074Z"<br>]</pre> | no |
| automation\_account\_variable\_int\_descriptions | List of description of the automation int variable. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_variable\_int\_encryptions | List which specifies if the automation int variable is encrypted. Defaults to `false`. | `list(bool)` | <pre>[<br>  false<br>]</pre> | no |
| automation\_account\_variable\_int\_names | List which specifies the names of automation int variable. Changing this forces a new resource to be created. If enabled this value is `Required`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_variable\_int\_values | The list of values of automation int variable as `Integer`. | `list(number)` | <pre>[<br>  1234<br>]</pre> | no |
| automation\_account\_variable\_string\_descriptions | List of description of the automation string variable. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_variable\_string\_encryptions | List which specifies if the automation string variable is encrypted. Defaults to `false`. | `list(bool)` | <pre>[<br>  false<br>]</pre> | no |
| automation\_account\_variable\_string\_names | List which specifies the names of automation string variable. Changing this forces a new resource to be created. If enabled this value is `Required`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_account\_variable\_string\_values | The list of values of automation string variable as `String`. | `list(string)` | <pre>[<br>  "Terraform"<br>]</pre> | no |
| automation\_credential\_enabled | Boolean flag which describes whether to enable the automation crdentials resource or not. | `bool` | `false` | no |
| automation\_credential\_names | List of names of the Credential. Changing this forces a new resource to be created. If enabled this value is `Required`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_module\_enabled | Boolean flag which describes whether or not enable the automation module resource. | `bool` | `false` | no |
| automation\_module\_names | The list which describes the names of the automation module. Changing this force a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| automation\_variable\_bool\_enabled | Boolean flag which describes whether or not to enable the resource. | `bool` | `false` | no |
| automation\_variable\_datetime\_enabled | Boolean flag which describes whether or not to enable the resource. | `bool` | `false` | no |
| automation\_variable\_int\_enabled | Boolean flag which describes whether or not to enable the resource. | `bool` | `false` | no |
| automation\_variable\_string\_enabled | Boolean flag which describes whether or not to enable the resource. | `bool` | `false` | no |
| enabled | Enable or diasble module. | `bool` | `true` | no |
| existing\_automation\_account\_names | List of names of the existing automation account names to which the credentials will be created. If `utomation_account_exist` is enabled then this value is `Required`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| location | Specifies the supported Azure location where the resourceexists. Changing this forces a new resource to be created.If enabled value is `Required`. | `string` | `""` | no |
| module\_link\_uri | The list of published module link uri of te module content (zip or nupkg).If enabled this value is `Required`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| monthly\_occurrence\_day | List of day of the occurrence. Must be one of `Monday`, `Tuesday`, `Wednesday`, `Thursday`, `Friday`, `Saturday`, `Sunday`. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| monthly\_occurrences | List of occurrence of the week within the month. Must be between `1` and `5`. `-1` for last week within the month. | `list(number)` | <pre>[<br>  1<br>]</pre> | no |
| publish\_content\_link\_uri | The list of uri of the runbook content. If enabled this value is `Required.` | `list(string)` | <pre>[<br>  null<br>]</pre> | no |
| resource\_group\_name | Name of the resource group of the automation acount resources should be exist.Changing this forces a new resource to be created. | `string` | `""` | no |
| tags | Tags shared by all resources of this module. Will be merged with any other specific tags by resource. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| automation\_account\_credential\_ids | IDs of the automation credentials. |
| automation\_account\_id | ID of the automation account. |
| automation\_account\_job\_ids | Ids of the automation job schedule. |
| automation\_account\_job\_schedule\_ids | The UUID identifying the automation job schedule. |
| automation\_account\_runbook\_ids | IDs of the automation account runbook. |
| automation\_account\_var\_bool\_ids | IDs of the automation account account variable bool. |
| automation\_account\_var\_datetime\_ids | Id of the automation acount variable date-time. |
| automation\_account\_var\_int\_ids | Id of the automation acount variable int. |
| automation\_account\_var\_string\_ids | Id of the automation acount variable string. |
| automation\_module\_ids | IDs of the automation module. |
| automation\_schedule\_ids | IDs of the automation schedules. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
