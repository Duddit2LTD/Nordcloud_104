$rg = 'rg-team-5-sep-case-arm-we'
$loc = 'northeurope'
$template = '.\HeroVoting\Deploy.json'
$params = '.\HeroVoting\Deploy.parameters.json'

New-AzResourceGroupDeployment -name MainDeployment -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params

New-AzResourceGroupDeployment -name MainDeployment -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params -WhatIf

New-AzResourceGroupDeployment -name MainDeployment -ResourceGroupName $rg -TemplateFile $TF -TemplateParameterFile $TFP -WhatIf  








