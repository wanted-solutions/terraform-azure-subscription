# terraform-module-template

Repository template for Terraform module.

> If you'd like to check module metadata usage in detail you can do it [here](./examples-module-metadata/README.md). Remove this quote and whole directory before publishing your module.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_consumption_budget_subscription.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_subscription) | resource |
| [azurerm_management_group_subscription_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) | resource |
| [azurerm_subscription.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) | resource |
| [azurerm_billing_enrollment_account_scope.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_enrollment_account_scope) | data source |
| [azurerm_billing_mca_account_scope.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_mca_account_scope) | data source |
| [azurerm_billing_mpa_account_scope.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_mpa_account_scope) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias"></a> [alias](#input\_alias) | The alias of the subscription. | `string` | `""` | no |
| <a name="input_billing_account_name"></a> [billing\_account\_name](#input\_billing\_account\_name) | The name of the billing account to associate with the subscription. | `string` | n/a | yes |
| <a name="input_billing_account_scope"></a> [billing\_account\_scope](#input\_billing\_account\_scope) | The scope of the billing account to associate with the subscription. | `any` | n/a | yes |
| <a name="input_billing_profile_name"></a> [billing\_profile\_name](#input\_billing\_profile\_name) | Name of the MCA billing profile. | `string` | `""` | no |
| <a name="input_budgets"></a> [budgets](#input\_budgets) | List of budgets to be assigned under subscription group. | <pre>list(object({<br>    name       = string<br>    amount     = number<br>    time_grain = string<br>    start_date = string<br>    end_date   = string<br>    filter = object({<br>      dimension = list(object({<br>        name   = string<br>        values = list(string)<br>      }))<br>      tag = list(object({<br>        name   = string<br>        values = list(string)<br>      }))<br>    })<br>    notifications = list(object({<br>      enabled        = bool<br>      threshold      = number<br>      operator       = string<br>      threshold_type = string<br>      contact_emails = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | Name of the MPA customer. | `string` | `""` | no |
| <a name="input_enrollment_account_name"></a> [enrollment\_account\_name](#input\_enrollment\_account\_name) | Name of the EA enrollment account. | `string` | `""` | no |
| <a name="input_invoice_section_name"></a> [invoice\_section\_name](#input\_invoice\_section\_name) | Name of the MCA invoice section. | `string` | `""` | no |
| <a name="input_management_group_id"></a> [management\_group\_id](#input\_management\_group\_id) | The ID of the management group to associate with the subscription. | `string` | `""` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Module metadata object to give user possibility to override default module values. | <pre>object({<br>    default_tags             = optional(map(string), {})<br>    resource_timeouts        = optional(map(map(string)), {})<br>    validator_error_messages = optional(map(string), {})<br>    validator_expressions    = optional(map(string), {})<br>  })</pre> | `{}` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The ID of the subscription. | `string` | `""` | no |
| <a name="input_subscription_name"></a> [subscription\_name](#input\_subscription\_name) | The name of the subscription. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Key value pairs of custom tags to be applied to the module resources. | `map(string)` | `{}` | no |
| <a name="input_workload"></a> [workload](#input\_workload) | The workload of the subscription. | `string` | `"Production"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_management_group_subscription_association"></a> [azurerm\_management\_group\_subscription\_association](#output\_azurerm\_management\_group\_subscription\_association) | value of azurerm\_management\_group\_subscription\_association.this |
| <a name="output_subscription"></a> [subscription](#output\_subscription) | value of azurerm\_subscription.this |
<!-- END_TF_DOCS -->

## Usage

> ADD content about usage