## Disabled example

- This should not create any resource.

## Usage
```
terraform init
terraform plan
terraform apply
terraform destroy
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.0.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| client\_id | Azure service principal application Id. | `string` | n/a | yes |
| client\_secret | Azure service principal application Secret. | `string` | n/a | yes |
| subscription\_id | Azure subscription Id. | `string` | n/a | yes |
| tenant\_id | Azure tenant Id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| automation\_account\_credential\_ids | IDs of the automation credentials. |
| automation\_account\_id | ID of the automation account. |
| automation\_account\_runbook\_ids | IDs of the automation account runbook. |
| automation\_job\_ids | Ids of the automation job schedule. |
| automation\_module\_ids | IDs of the automation module. |
| automation\_schedule\_ids | IDs of the automation schedules. |
| automation\_var\_bool\_ids | IDs of the automation account account variable bool. |
| automation\_var\_datetime\_ids | Id of the automation acount variable date-time. |
| automation\_var\_int\_ids | Id of the automation acount variable int. |
| automation\_var\_string\_ids | Id of the automation acount variable string. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
