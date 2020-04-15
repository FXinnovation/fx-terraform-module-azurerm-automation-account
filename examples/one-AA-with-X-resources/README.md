## Default example

- This should create few resources related to the automation account.

## Usage
```
terraform init
terraform apply
terraform destroy
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| azurerm | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.0.0 |
| local | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_id | Azure service principal application Id. | `string` | n/a | yes |
| client\_secret | Azure service principal application Secret. | `string` | n/a | yes |
| subscription\_id | Azure subscription Id. | `string` | n/a | yes |
| tenant\_id | Azure tenant Id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| automation\_account\_credential\_ids | n/a |
| automation\_account\_id | n/a |
| automation\_account\_runbook\_ids | n/a |
| automation\_job\_ids | n/a |
| automation\_module\_ids | n/a |
| automation\_schedule\_ids | n/a |
| automation\_variable\_bool\_ids | n/a |
| automation\_variable\_datetime\_ids | n/a |
| automation\_variable\_int\_ids | n/a |
| automation\_variable\_string\_ids | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
