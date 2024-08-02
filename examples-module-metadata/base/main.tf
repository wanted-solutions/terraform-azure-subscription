module "base_metadata_example" {
    source = "../.."
    // Here you'll be passing the input values into the module

    // Here you can override module default metadata values by passing the metadata object from root module
    metadata = {
        resource_timeouts = {
            default = {
                create = "30m"
                read   = "5m"
                update = "30m"
                delete = "30m"
            }
        }
        validator_error_messages = {
            default       = "Unknown error during validation has occured."
            timeout_key   = "Timeout key is not valid, please check your \"metadata\" object, only \"create\", \"read\", \"update\" and \"delete\" can be used as metadata key value."
            timeout_value = "Timeout value is not in valid format, please check your \"metadata\" object."
        }
        validator_expressions = {
            default       = ".*"
            timeout_key   = "^(create|read|update|delete)$"
            timeout_value = "^[0-9]+[smh]$"
        }
    }
}