#Login-AzAccount

New-AzResourceGroup -Name arm-storage-group -Location Eastus

New-AzResourceGroupDeployment -ResourceGroupName arm-storage-group -TemplateFile .\storagetemplate.json -TemplateParameterFile .\storageparameters.json -Verbose