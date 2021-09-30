$rg = 'rg-team-5-sep-case-arm-we'
$loc = 'northeurope'
$template = '.\Deploy.json'
$params = '.\Deploy.parameters.json'

New-AzResourceGroupDeployment -name MainDeployment -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params

New-AzResourceGroupDeployment -name MainDeployment -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params -WhatIf




$template = '.\Artifacts\Application.json'
$params = '.\Artifacts\Application.parameters.json'







