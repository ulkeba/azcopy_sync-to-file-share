#!/bin/bash

export STORAGE_ACCOUNT_NAME=storageaccountname01
export STORAGE_FILE_SHARE_NAME=myfileshare

end=$(date -u -d "600 minutes" '+%Y-%m-%dT%H:%MZ')
sas=$(az storage share generate-sas -n $STORAGE_FILE_SHARE_NAME --account-name $STORAGE_ACCOUNT_NAME --https-only --permissions dlrw --expiry $end -o tsv)

while [ true ];
do
  sleep 10s;
  azcopy sync \
    ./demo-files "https://$STORAGE_ACCOUNT_NAME.file.core.windows.net/$STORAGE_FILE_SHARE_NAME?$sas" \
    --recursive \
    --delete-destination true
done;