provider "azurerm" {
  features {}
}

run "apply" {
  command = apply

  module {
    source = "./examples/02-full"
  }

  # We verify that consumption budget was created. 
  assert {
    condition     = length(output.consumption_budget_id) > 0
    error_message = "Consumption budget was not created"
  }

  assert {
    condition     = length(output.cost_anomaly_alert_id) > 0
    error_message = "Cost anomaly alert was not created"
  }
}
