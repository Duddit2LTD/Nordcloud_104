$rg = 'rg-team-5-sep-case-arm-we'
$loc = 'northeurope'
$template = 'G:\My Drive\Repos\Nordcloud_104\HeroVoting\Deploy.json'
$params = 'G:\My Drive\Repos\Nordcloud_104\HeroVoting\Deploy.parameters.json'

New-AzResourceGroupDeployment -name loganalytics -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params -WhatIf

New-AzResourceGroupDeployment -name loganalytics -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params

Test-AzResourceGroupDeployment -name loganalytics -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params

$rg = 'rg-team-5-sep-case-arm-we'
$loc = 'northeurope'
$template = 'G:\My Drive\Repos\Nordcloud_104\HeroVoting\Artifacts\LogAnalytics.json'
$params = 'G:\My Drive\Repos\Nordcloud_104\HeroVoting\Artifacts\LogAnalytics.parameters.json'

New-AzResourceGroupDeployment -name loganalytics -ResourceGroupName $rg -TemplateFile $template -TemplateParameterFile $params -WhatIf

