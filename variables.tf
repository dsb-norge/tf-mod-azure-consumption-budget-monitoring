variable "app_short_name" {
  description = "Name of app short, used for rg"
  type        = string
}

variable "consumption_budget_amount" {
  description = "The amount of money to be consumed"
  type        = number

  validation {
    condition     = var.consumption_budget_amount > 0
    error_message = "The consumption budget amount must be greater than 0"
  }
}

variable "environment" {
  description = "The runtime environment targeted. Development, test, qa, production etc"
  type        = string
}

variable "subscription" {
  description = "The subscription"
  type        = string
}

variable "consumption_budget_notification_cfg" {
  description = "The notification blocks"
  type = map(object({
    enabled        = optional(bool)
    threshold      = optional(number)
    operator       = optional(string)
    contact_emails = optional(list(string))
  }))
  nullable = false # If nullable is false and the variable has a default value, then Terraform uses the default when a module input argument is null
  default = {
    # the default is a single disabled notification with otherwise default values
    "notification1" = {
      enabled = false
    }
  }
}

variable "consumption_budget_time_grain" {
  description = "The time grain for the consumption budget"
  type        = string
  default     = "Monthly"

  validation {
    error_message = "value must be one of BillingAnnual, BillingMonth, BillingQuarter, Annually, Monthly and Quarterly"
    condition     = can(var.consumption_budget_time_grain) && contains(["BillingAnnual", "BillingMonth", "BillingQuarter", "Annually", "Monthly", "Quarterly"], var.consumption_budget_time_grain)
  }
}

variable "cost_anomaly_alert_email_receivers" {
  description = "The email addresses to receive cost anomaly alerts"
  type        = list(string)
  default     = []

  validation {
    error_message = "value must be a valid email address"
    condition     = can(var.cost_anomaly_alert_email_receivers) && alltrue([for email in var.cost_anomaly_alert_email_receivers : can(regex("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$", email))])
  }
}
