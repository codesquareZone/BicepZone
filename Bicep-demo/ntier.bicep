param vnet_name string = 'ntier'
param vnet_address string = '10.0.0.0/16'
param vnet_info object = {
  name : 'vnet'
  location: resourceGroup().location
  addressPrefix: '10.0.0.0/16'
  subnet1AddresPrefix: '10.0.0.0/24'
  subnet2AddresPrefix: '10.0.1.0/24'
}

resource vnet 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnet_name
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet_address
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: vnet_info.subnet1AddresPrefix
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: vnet_info.subnet2AddresPrefix
        }
      }
    ]
  }
}

