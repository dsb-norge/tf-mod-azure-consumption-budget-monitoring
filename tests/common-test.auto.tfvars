# Input vars for tests

consumption_budget_amount = 5000
app_short_name            = "my-azure-app"
subscription              = "subscription-test-name"
environment               = "prod"

_test_expected_attributes = {
  cost_anomaly_alert_name = "cost-anomaly-alert-subscription-test-name-my-azure-app-prod"
}