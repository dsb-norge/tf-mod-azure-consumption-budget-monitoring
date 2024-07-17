provider "azurerm" {
  features {}
}

run "apply" {
  command = apply

  module {
    source = "./examples/01-basic"
  }

  # We verify that consumption budget was created. 
  assert {
    condition     = length(output.consumption_budget_id) > 0
    error_message = "Consumption budget was not created"
  }
}
