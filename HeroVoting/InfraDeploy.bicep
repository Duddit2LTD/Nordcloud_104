param sub string
param RG string
param location string
param prefix string
param ExternalDNS string

//IP Ranges
param FE_VNET_IP_Range string
param BE_VNET_IP_Range string
param SN_FE_AppGW_Range string
param SN_FE_PL_Range string
param SN_BE_ASP_VNINT_Range string
param SN_BE_APIVMSS_Range string
param SN_BE_DB_Range string

var VNETName = '${prefix}-VNET-${location}'
var AppGWName = '${prefix}-AppGW-${location}'
var AppSVCName = '${prefix}-AppSVC-${location}'
var AppSVCPlanNAme = '${AppSVCName}-Plan'
var DBServerName = '${prefix}-DBServ-${location}'
var VMSSNAme = '${prefix}-APIvmss-${location}'
var ContainerRegName = '${prefix}-ContReg-${location}'
var KeyVaultName = '${prefix}-KV-${location}'
var RouteTableName = '${prefix}-RT-BELB-${location}'


