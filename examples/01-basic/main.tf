provider "azurerm" {
  features {}
}

module "consumption_budget" {
  source = "../../"

  app_short_name            = "my-budget-basic"
  subscription              = "sub-name"
  environment               = "prod"
  consumption_budget_amount = 9000 # in local currency of subscription location
  consumption_budget_notification_cfg = {
    "80_percent_consumed" = {
      contact_emails = ["vaild.dummy@epost.her"]
    }
  }
}

