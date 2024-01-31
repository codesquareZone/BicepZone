param vnet_info object = {
  name: 'vnet'
  location: 'eastus'
  addressPrefixes: '10.10.0.0/16'
  subnets:[
    {
      name: 'subnet-1'
      addressPrefixes: '10.10.0.0/24'
    }
    {
      name: 'subnet-2'
      addressPrefixes: '10.10.1.0/24'
    }
  ]
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnet_info.name
  location: vnet_info.location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet_info.addressPrefixes
      ]
    }
    subnets: [
      {
        name: vnet_info.subnets[0].name
        properties: {
          addressPrefix: vnet_info.subnet[0].addressPrefixes
        }
      }
      {
        name: vnet_info.subnets[1].name
        properties: {
          addressPrefix: vnet_info.subnets[1].name
        }
      }
    ]
  }
}
