#Login-AzAccount

#New-AzResourceGroup -Name arm-group -Location Eastus

New-AzResourceGroupDeployment -ResourceGroupName arm-group -TemplateFile .\storagetemplate.json -TemplateParameterFile .\storageparameters.json -Mode Complete -Verbose