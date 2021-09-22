param sub string
param RG string
param vmname string = 'perfectvm005'
param adminusername string
param location string 
@secure()
param adminpasswordorkey string
param VMSize string = 'Standard_DS2_v2'
param virtualnetworkname string
param subnetname string
param imagegalleryname string
param imagename string

var imageid = '/subscriptions/${sub}/resourceGroups/${RG}/providers/Microsoft.Compute/galleries/${imagegalleryname}/images/${imagename}/versions/1.0.0'
var publicipaddressname = '${vmname}-PIP'
var networkinterfacename = '${vmname}-NIC01'
var dnslabelprefix = '${vmname}dns'
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
        id: imageid
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
