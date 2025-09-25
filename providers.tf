terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg_tfstate"
    storage_account_name = "storageaccounttfstate1"
    container_name       = "containertfstate1"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  # subscription_id = var.azure_subscription_id
  # tenant_id       = var.azure_tenant_id
  # client_id       = var.azure_client_id
  # client_secret   = var.azure_client_secret
  subscription_id = "cf5274c6-d6b9-4ab3-a8d7-afd83781e6b6"
  tenant_id       = "297246f1-5c28-4f6f-88aa-8990cb7383b1"
  client_id       = "14e0a936-0371-45fc-b3ff-32c154a9a121"
  client_secret   = "Eob8Q~C-g5lTeCDFQ9ZibR3waJtIbdGvurhzxbCA"
}

provider "azapi" {
  subscription_id = var.azure_subscription_id
  # tenant_id       = var.azure_tenant_id
  tenant_id       = "297246f1-5c28-4f6f-88aa-8990cb7383b1"
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
}