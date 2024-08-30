# outputs.tf left empty on purpose, required by tflint
output "consumption_budget_id" {
  value       = azurerm_consumption_budget_subscription.sub_budget_consumption.id
  description = "value of the consumption budget id"
}

output "cost_anomaly_alert_id" {
  value       = azurerm_cost_anomaly_alert.sub_cost_anomaly_alert[*].id
  description = "value of the cost anomaly alert id"
}
