param location string = resourceGroup().location
param storageNamePrefix string
param acr_name string = 'aditya0901'
param asb_name string = 'aditya0901'

var stgacc_name = '${storageNamePrefix}${uniqueString(resourceGroup().id)}'

resource storage_account 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: stgacc_name
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource container_registry 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' = {
  name: acr_name
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}


resource asb 'Microsoft.ServiceBus/namespaces@2022-01-01-preview' = {
    name: asb_name
    location: location
}
