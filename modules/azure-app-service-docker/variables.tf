variable "registry_name" {
  default = "dockerregistrydotnet"
}

variable "app_service_plan_name" {
  default = "microservice"
}

variable "app_service_name" {
  default = "microservice"
}

variable "app_service_plan_os" {
  default = "Linux"
}

variable "app_service_plan_sku" {
  default = "B1"
}

variable "region" {
  default = "Central India"
}

variable "resource_group_name" {
    default = "microservice"   
}

variable "sku" {
    default = "Standard"   
}

variable "cosmos_db_name" {
    default = "microservice"   
}

variable "max_throughput" {
  type        = number
  default     = 4000
  description = "Cosmos db database max throughput"
  validation {
    condition     = var.max_throughput >= 4000 && var.max_throughput <= 1000000
    error_message = "Cosmos db autoscale max throughput should be equal to or greater than 4000 and less than or equal to 1000000."
  }
  validation {
    condition     = var.max_throughput % 100 == 0
    error_message = "Cosmos db max throughput should be in increments of 100."
  }
}