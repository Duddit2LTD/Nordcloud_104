#Use these to set default variables for main deployment
$rg = 'rg-team-5-sep-case-arm-we'
$loc = 'northeurope'
$template = '.\Deploy.json'
$params = '.\Deploy.parameters.json'

#Deployment WHAT IF
New-AzResourceGroupDeployment -name MainDeployment -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params -WhatIf

#Deployment
New-AzResourceGroupDeployment -name MainDeployment -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params
    

#use these to set temp file path variables
$template = '.\HeroVoting\Artifacts\VMSS.json'
$params = '.\HeroVoting\Artifacts\VMSS.parameters.json'







