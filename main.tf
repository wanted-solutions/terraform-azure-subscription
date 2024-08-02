resource "azurerm_subscription" "this" {
  subscription_name = var.subscription_name
  subscription_id   = var.subscription_id
  billing_scope_id  = (length(data.azurerm_billing_mca_account_scope.this != null ? data.azurerm_billing_mca_account_scope.this : []) > 0) ? data.azurerm_billing_mca_account_scope.this[0].id : (length(data.azurerm_billing_mpa_account_scope.this != null ? data.azurerm_billing_mpa_account_scope.this : []) > 0) ? data.azurerm_billing_mpa_account_scope.this[0].id : (length(data.azurerm_billing_enrollment_account_scope.this != null ? data.azurerm_billing_enrollment_account_scope.this : []) > 0) ? data.azurerm_billing_enrollment_account_scope.this[0].id : null
  alias             = var.alias != "" ? var.alias : null
  workload          = var.workload
  tags              = local.tags
}