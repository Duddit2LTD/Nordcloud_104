param vmname string = 'PerfectVM-dev'
param adminusername string = 'perfectadmin'
//param authenticationtype string
param location string 
param adminpasswordorkey string = 'vdfvfefe34324'
param dnslabelprefix string
param ubuntuOSVersion string
param VMSize string = 'Standard_DS2_v2'
param location string
param virtualnetworkname string = 'PerfectVM-Networks'
param subnetname string = 'PErfectVM-Dev'
//param networksecuritygroupname string


var publicipaddressname = 'perfectpip'
var networkinterfacename = 'nic01'
var subnetref = '${vnet.id}/subnets/${subnetname}'
var OSDiskType = 'StandardSSD_LRS'

resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  name: virtualnetworkname
  
}


resource PIP 'Microsoft.Network/publicIPAddresses@2021-02-01' = {
  name: publicipaddressname
  location: location
  sku: {
    name: 'Basic'
    tier: 'Regional'
  }

  properties: {
    publicIPAllocationMethod: 'Dynamic'
    publicIPAddressVersion: 'IPv4'
    dnsSettings: {
      domainNameLabel: dnslabelprefix
    }
    idleTimeoutInMinutes: 4
  }
}


resource Nic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name: networkinterfacename
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          publicIPAddress: {
            id: PIP.id
          }
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnetref
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
  }
}

resource perfectVM 'Microsoft.Compute/virtualMachines@2021-04-01' = {
  name: vmname
  location: location
  dependsOn: [
    PIP
  ]
  properties: {
    hardwareProfile: {
      vmSize: VMSize

    }
    networkProfile: {
      networkInterfaces: [
        {
          id: Nic.id
        }
      ]
    }

    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: OSDiskType
        }
      }
      imageReference: {
        publisher: 'canonical'
        offer: 'UbuntuServer'
        sku: ubuntuOSVersion
        version: 'latest'
      }
    }
    osProfile: {
      computerName: vmname
      adminUsername: adminusername
      adminPassword: adminpasswordorkey
      linuxConfiguration: {
        patchSettings: {
          assessmentMode: 'ImageDefault'
          patchMode: 'ImageDefault'
        }

      }
    }
  }
}
