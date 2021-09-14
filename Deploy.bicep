param prefix string
param vnetprefix string
param TAGS object

var location = (resourceGroup().location)


var VNETS = [
  {
    name:'${prefix}-${vnetprefix}'
    Location:''
    AddressSpace: ''
    SN01Name: ''
    SN01AddressSpace: ''
    SN02Name: ''
    SN02AddressSpace: ''
  }
]

resource vnets 'Microsoft.Network/virtualNetworks@2021-02-01' =  [for Vnet in VNETS: {
  name: Vnet.name
  location: Vnet.Location
  tags: TAGS
  properties: {
    addressSpace: {
      addressPrefixes:[
        Vnet.AddressSpace
      ]
    }
    dhcpOptions: {
      dnsServers: [
        
      ]
    }
    subnets: [
      {
        name: Vnet.SN01Name
        properties: {
          addressPrefix: Vnet.SN01AddressSpace
          serviceEndpoints: [
            {
              service: 'microsoft.sql'
              locations: [
                location
              ]
            }
            {
              service: 'microsoft.Storage'
              locations: [
                location
              ]
            }
            {
              service: 'Microsoft.Keyvault'
              locations: [
                '*'
              ]
            }
          ]
        }
      }
    ]
  }

}]
