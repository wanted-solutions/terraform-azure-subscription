resource "azurerm_consumption_budget_subscription" "this" {
  for_each = {
    for budget in var.budgets : budget.name => budget
  }

  name            = each.value.name
  subscription_id = azurerm_subscription.this.id
  amount          = each.value.amount
  time_grain      = each.value.time_grain

  time_period {
    start_date = each.value.start_date
    end_date   = each.value.end_date
  }

  filter {
    dynamic "dimension" {
      for_each = {
        for dimension in each.value.filter.dimensions : dimension.name => dimension
      }
      content {
        name   = dimension.value.name
        values = dimension.value.value
      }

    }

    dynamic "tag" {
      for_each = {
        for tag in each.value.filter.tag : tag.name => tag
      }
      content {
        name   = tag.value.name
        values = tag.value.values
      }

    }
  }

  dynamic "notification" {
    for_each = {
      for notification in each.value.notifications : notification.name => notification
    }
    content {
      enabled        = notification.value.enabled
      threshold      = notification.value.threshold
      operator       = notification.value.operator
      threshold_type = notification.value.threshold_type
      contact_emails = notification.value.contact_emails
    }
  }

  timeouts {
    create = (
      (lookup(local.metadata.resource_timeouts, "azurerm_consumption_budget_subscription", null) != null)
      ? (lookup(local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"], "create", null) != null)
      ? local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"]["create"]
      : local.metadata.resource_timeouts.default.create
      : local.metadata.resource_timeouts.default.create
    )
    read = (
      (lookup(local.metadata.resource_timeouts, "azurerm_consumption_budget_subscription", null) != null)
      ? (lookup(local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"], "read", null) != null)
      ? local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"]["read"]
      : local.metadata.resource_timeouts.default.read
      : local.metadata.resource_timeouts.default.read
    )
    update = (
      (lookup(local.metadata.resource_timeouts, "azurerm_consumption_budget_subscription", null) != null)
      ? (lookup(local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"], "update", null) != null)
      ? local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"]["update"]
      : local.metadata.resource_timeouts.default.update
      : local.metadata.resource_timeouts.default.update
    )
    delete = (
      (lookup(local.metadata.resource_timeouts, "azurerm_consumption_budget_subscription", null) != null)
      ? (lookup(local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"], "delete", null) != null)
      ? local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"]["delete"]
      : local.metadata.resource_timeouts.default.delete
      : local.metadata.resource_timeouts.default.delete
    )
  }
}