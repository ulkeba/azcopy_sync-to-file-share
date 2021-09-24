export LOCATION=westeurope
export SUB_ID=aaaaaaaa-0000-0000-0000-000000000000
export RG_NAME=rgname-d01
export STORAGE_ACCOUNT_NAME=storageaccountname01
export STORAGE_FILE_SHARE_NAME=myfileshare

az group create \
  --subscription $SUB_ID \
  --name $RG_NAME \
  --location $LOCATION

az storage account create \
  --subscription $SUB_ID \
  --resource-group $RG_NAME \
  --name $STORAGE_ACCOUNT_NAME \
  --sku Premium_LRS \
  --kind FileStorage

az storage share-rm create \
  --resource-group $RG_NAME \
  --storage-account $STORAGE_ACCOUNT_NAME \
  --name $STORAGE_FILE_SHARE_NAME \
  --quota 100

az storage share-rm show \
  --resource-group $RG_NAME \
  --storage-account $STORAGE_ACCOUNT_NAME \
  --name $STORAGE_FILE_SHARE_NAME \
