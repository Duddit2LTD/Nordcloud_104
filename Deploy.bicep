param prefix string
param vnetprefix string
param TAGS object
param location string
param SN01Name string
param SN02Name string
param HubVNetName string
param HubVNetAddressSpace string
param AZureFirewallSubnetAddressSpace string


var VNETS = [
  {
    name:'${prefix}-${vnetprefix}-VN01'
    Location: location
    AddressSpace: '10.0.0.0/16'
    SN01Name: SN01Name
    SN01AddressSpace: ''
    SN02Name: SN02Name
    SN02AddressSpace: ''
  }
  {
    name:'${prefix}-${vnetprefix}-VN02'
    Location:location
    AddressSpace: '10.1.0.0/16'
    SN01Name: SN01Name
    SN01AddressSpace: ''
    SN02Name: SN02Name
    SN02AddressSpace: ''
  }
  {
    name:'${prefix}-${vnetprefix}-VN03'
    Location:location
    AddressSpace: '10.2.0.0/16'
    SN01Name: SN01Name
    SN01AddressSpace: ''
    SN02Name: SN02Name
    SN02AddressSpace: ''
  }
  {
    name:'${prefix}-${vnetprefix}-VN04'
    Location:location
    AddressSpace: '10.3.0.0/16'
    SN01Name: SN01Name
    SN01AddressSpace: ''
    SN02Name: SN02Name
    SN02AddressSpace: ''
  }
  {
    name:'${prefix}-${vnetprefix}-VN05'
    Location:location
    AddressSpace: '10.4.0.0/16'
    SN01Name: SN01Name
    SN01AddressSpace: ''
    SN02Name: SN02Name
    SN02AddressSpace: ''
  }
]


resource DeployHubVNet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: HubVNetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        HubVNetAddressSpace
      ]
    }
     dhcpOptions: {
       dnsServers: [
         
       ]
     }
     subnets: [
       {
         name:'Azurefirewallsubnet'
         properties: {
           addressPrefixes: [
             AZureFirewallSubnetAddressSpace
           ]
         }
       }
     ]
  }

}

resource DeployVNets 'Microsoft.Network/virtualNetworks@2021-02-01' =  [for Vnet in VNETS: {
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
