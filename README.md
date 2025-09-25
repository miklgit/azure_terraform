# mikl_azure

##

### Plan

``` psh
terraform plan -out main.tfplan -var-file <secrets_path>
```

### Apply

``` psh
terraform apply main.tfplan
```