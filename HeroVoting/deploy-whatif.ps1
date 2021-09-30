#Use these to set default variables for main deployment
$rg = 'rg-team-5-sep-case-arm-we'
$loc = 'northeurope'
$template = '.\HeroVoting\Deploy.json'
$params = '.\HeroVoting\Deploy.parameters.json'

#Deployment WHAT IF
New-AzResourceGroupDeployment -name MainDeployment -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params -WhatIf


# Use to delete resources based on tags
$rg= "rg-team-5-sep-case-arm-we"
$tagname = "Delete”
$TagValue = ”Yes”
Get-AzResource -TagName $tagname -TagValue $TagValue | where{$_.resourcegroupname -eq $rg}| Remove-AzResource -force












































#Deployment
New-AzResourceGroupDeployment -name MainDeployment -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params
    

#use these to set temp file path variables
$template = '.\HeroVoting\Artifacts\VMSS.json'
$params = '.\HeroVoting\Artifacts\VMSS.parameters.json'







