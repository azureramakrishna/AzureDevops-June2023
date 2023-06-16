#Login-AzAccount

New-AzResourceGroup -Name arm-group -Location Eastus

New-AzResourceGroupDeployment -ResourceGroupName arm-group -TemplateFile .\template.json -TemplateParameterFile .\parameters.json -Verbose