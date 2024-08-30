output "consumption_budget_id" {
  description = "The consumption budget id"
  value       = module.consumption_budget.consumption_budget_id
}

output "cost_anomaly_alert_id" {
  description = "The cost anomaly alert id"
  value       = module.consumption_budget.cost_anomaly_alert_id
}
