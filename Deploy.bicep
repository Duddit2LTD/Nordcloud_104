param prefix string
param vnetprefix string
param TAGS object

var location = (resourceGroup().location)

resource vnets 'Microsoft.Network/virtualNetworks@2021-02-01' =  {
  name: '${prefix}-${vnetprefix}-${location}'
  location: location
  tags: TAGS
  properties: {
    addressSpace: {
      addressPrefixes:[
        '10.1.0.0/16'
      ]
    }
    dhcpOptions: {
      dnsServers: [
        
      ]
    }
    subnets: [
      {
        name: 'SN1'
        properties: {
          addressPrefix: '10.1.0.0/24'
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
  
}
