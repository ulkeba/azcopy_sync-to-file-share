# Demo for sync of file system directory to an Azure Files share
The scripts in this repository show the repeated sync of a file system directory to a file share. 

To run the demo, proceed with following steps:

1. In ```fileshare_create.sh``` and ```demofiles_sync.sh```, change variable values to point to your subscription and give names for your demo resource group, storage account and file share.
1. Run ```fileshare_create.sh``` to create the demo resource group, storage account and file share.
1. Start ```demofiles_writer.sh``` (creating 20 demo files and continuously changing a random number of them) and keep it running.
   ``` 
   $ ./demofiles_writer.sh
   Creating / overwriting 20 files...
   Updating 10 randomly selected files...
   Updating 1 randomly selected files...
   Updating 6 randomly selected files...
   ...
   ``` 
1. Start ```demofiles_sync.sh``` that invokes ```azcopy sync``` every 10 seconds and observe how... 
   - ...all 20 files are copied on first synchronization and ...
   - ...only updated files will get copied afterwards:
   ```
   Total Number Of Copy Transfers: 20
   ...
   Total Number Of Copy Transfers: 11
   ...
   Total Number Of Copy Transfers: 11
   ```