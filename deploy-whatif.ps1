$rg = 'rg-team-5-sep-case-arm-we'
$loc = 'northeurope'
$template = '.\HeroVoting\Deploy.json'
$params = '.\HeroVoting\Deploy.parameters.json'

New-AzResourceGroupDeployment -name loganalytics -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params

New-AzResourceGroupDeployment -name loganalytics -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params -WhatIf

Test-AzResourceGroupDeployment -name loganalytics -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params

$rg = 'rg-team-5-sep-case-arm-we'
$loc = 'northeurope'
$template = '.\HeroVoting\Artifacts\LogAnalytics.json'
$params = '.\HeroVoting\Artifacts\LogAnalytics.parameters.json'

New-AzResourceGroupDeployment -name loganalytics -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params -WhatIf

$rg = 'rg-team-5-sep-case-arm-we'
$loc = 'northeurope'
$template = '.\HeroVoting\Artifacts\Bastion.json'
$params = '.\HeroVoting\Artifacts\Bastion.parameters.json'

New-AzResourceGroupDeployment -name loganalytics -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params -WhatIf

