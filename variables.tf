// Define the module input metadata variable
variable "metadata" {
  description = "Module metadata object to give user possibility to override default module values."
  type = object({
    resource_timeouts        = optional(map(map(string)), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
  default = {}

  validation {
    condition = alltrue(
      flatten([
        for value in var.metadata.resource_timeouts : [
          for timeout in value : timeout != null
          ? can(
            regex(
              local.definitions.validator_expressions["timeout_value"],
              timeout
            )
          )
          : true
        ]
      ])
    )
    error_message = lookup(
      local.definitions.validator_error_messages,
      "timeout_value",
      local.definitions.validator_error_messages["default"]
    )
  }

  validation {
    condition = alltrue(
      flatten([
        for value in var.metadata.resource_timeouts : [
          for key, timeout in value : timeout != null
          ? can(
            regex(
              local.definitions.validator_expressions["timeout_key"],
              key
            )
          )
          : true
        ]
      ])
    )
    error_message = lookup(
      local.definitions.validator_error_messages,
      "timeout_key",
      local.definitions.validator_error_messages["default"]
    )
  }
}
