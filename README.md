# azure_terraform

## Prérequis Azure

- Create Resource Group

```shell
az group create --name rg_tfstate --location westeurope
```

- Create Storage Account

```shell
az storage account create --name storageaccounttfstate1 --resource-group rg_tfstate --location westeurope --sku Standard_LRS
```

- Create Storage Container

```shell
az storage container create --name containertfstate1 --account-name storageaccounttfstate1 --auth-mode login
```

- Create Service Principal

La méthode _AzureCli Authorizer_ repose sur une session active via az login. Dans GitHub Actions, pas de session interactive → donc az login ne peut pas être lancé automatiquement.

Passer par une authentification via Service Principal

```shell
az ad sp create-for-rbac --name "sp_github" --role="Contributor" --scopes="/subscriptions/${AZURE_SUBSCRIPTION_ID}" --sdk-auth
```

## Prérequis Github Actions

- Déclaration des secrets pour le repository

```txt
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_SUBSCRIPTION_ID
AZURE_TENANT_ID
```

- Appel des secrets dans le fichier .github/workflows/myworkflow.yml

```yml
    env:
      ARM_CLIENT_ID: ${{ secrets.AZURE_CLIENT_ID }}
      ARM_CLIENT_SECRET: ${{ secrets.AZURE_CLIENT_SECRET }}
      ARM_SUBSCRIPTION_ID: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
      ARM_TENANT_ID: ${{ secrets.AZURE_TENANT_ID }}
```

## providers.tf

Le provider azurerm reconnait automatiquement les variables ARM*. **Plus besoin de passer les variables**

```t
provider "azurerm" {
  features {}
  # subscription_id = var.azure_subscription_id
  # tenant_id       = var.azure_tenant_id
  # client_id       = var.azure_client_id
  # client_secret   = var.azure_client_secret
}
```

