Connect-AzAccount


#get resources based on delete tag
Get-AzResource -Tag @{"DeleteResource" = "YES"}
#get resources based on lab
Get-AzResource -Tag @{"Lab Name" = "***"}




#to use when creating resources via powershell
$tags = @{"Lab Name"="RBAC";"DeleteResource"="YES"}



New-AzResourceGroup -Name "LAB_RG_01" -Location uksouth 

New-AzResourceGroupDeployment -TemplateFile '.\Deploy.bicep' -ResourceGroupName 'LAB_RG_01' -name deployvnets


