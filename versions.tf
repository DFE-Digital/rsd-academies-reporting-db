terraform {
  required_version = ">= 1.8.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.99.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = ">= 1.12.1"
    }
  }
}
