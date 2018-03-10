# DeleteDscTmpFile
Custom DSC module capable of finding and removing temporary MOFs created by Azure Automation DSC

### Synopsis
Custom DSC module that can be used to search C:\Windows\Temp and remove temporary MOF files.

### Description
This module was co-developed with the Microsoft Support team to resolve a vulnerability where clear-text MOF files are leftover when using DSC with Azure Automation. 

Azure Automation (as explained by the MS Support team) pulls down the MOF in clear form from Azure Automation over SSL to C:\windows\Temp\<id>\localhost.mof (note: this ID is randomly generated)

Once there, Azure Automation uses the certificates in Azure to encrypt that MOF to the final destination C:\windows\system32\Configuration\Current.mof

However, during this process Azure Automation is not removing the clear text localhost.mof

This module can be leveraged in your existing DSC to cleanup these files and ensure the only copy of your DSC is the properly encrypted Current.mof

### How to run
This repo contains a properly zipped module for use with Azure Automation.

Upload the zipped module to your Azure Automation account.

Add the following to your DSC configuration:

```powershell
Import-DscResource -ModuleName DeleteDscTmpFile

#remove clearText MOFs from c:\windows\temp
DeleteDscTmpFile removeClearMOFs{
    ClearMOFSRemove = $true
}
```
Re-compile your configuration.  Your DSC will now clean up after itself when devices pull down the new config, removing all clear text temporary MOFs which may contain sensitive information.

### Contributors

Author: Jake Morrison - http://techthoughts.info

Contributor: Microsoft Azure Support Team

### Notes

The vulnerability issue with the clear-text temporary MOFs is discussed in the following two locations if you would like additional information:

https://www.reddit.com/r/AZURE/comments/82fah0/azure_automation_dsc_mof_encryption/

https://social.msdn.microsoft.com/Forums/sqlserver/en-US/1ce230e4-56cf-4ddf-b61a-4e62334c5214/azure-automation-dsc-mof-encryption?forum=azureautomation