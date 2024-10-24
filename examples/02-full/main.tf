provider "azurerm" {
  features {}
}

module "consumption_budget" {
  source = "../../"

  app_short_name            = "my-budget-full"
  subscription              = "sub-name"
  environment               = "prod"
  consumption_budget_amount = 9000 # in local currency of subscription location
  consumption_budget_notification_cfg = {
    "80_percent_consumed" = {
      contact_emails = ["vaild.dummy@epost.her"]
    }
    "100_precent_consumed" = {
      threshold = 100.0
      contact_emails = [
        "valid.first@epost.her",
        "valid.second@epost.her"
      ]
    }
  }

  cost_anomaly_alert_email_receivers = ["vaild.dummy@epost.her"]
}

