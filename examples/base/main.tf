provider "azurerm" {
  features {
    
  }
}
module "base_metadata_example" {
    source = "../.."
    billing_account_name = "your_billing_account_name"
    billing_account_scope = "your_billing_account_scope"
    subscription_name = "your_subscription_name"
    // Here you'll be passing the input values into the module
    
}