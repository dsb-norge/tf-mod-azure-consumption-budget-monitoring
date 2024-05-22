variable "app_short_name" {
  description = "Name of app short, used for rg"
  type        = string
}

variable "consumption_budget_amount" {
  description = "The amount of money to be consumed"
  type        = number
}

variable "cost_anomaly_alert_email_receivers" {
  description = "The email addresses to receive cost anomaly alerts"
  type        = list(string)
  nullable    = false
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
}
