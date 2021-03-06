#
# Module manifest for module 'MPCDSC'
#
# Generated by: JakeMorrison
#
# Generated on: 3/8/2018
#

@{
    # Version number of this module.
    ModuleVersion = '1.0.0.1'
    
    # ID used to uniquely identify this module
    GUID = 'cc7dc011-ea5f-4f96-8ecf-dfd68a6d9d48'
    
    # Author of this module
    Author = 'Jake Morrison'
    
    # Company or vendor of this module
    CompanyName = 'Rackspace'
    
    # Copyright statement for this module
    Copyright = '(c) 2018 Rackspace. All rights reserved.'
    
    # Description of the functionality provided by this module
    Description = 'DSC module that can be used to identify and remove clear text MOF files in the C:\windows\temp location'
    
    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '4.0'
    
    # Minimum version of the common language runtime (CLR) required by this module
    CLRVersion = '4.0'
    
    # Functions to export from this module
    FunctionsToExport = '*'
    
    # Cmdlets to export from this module
    CmdletsToExport = '*'
    
    #Root module
    RootModule = ''
    
    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{
    
        PSData = @{
    
            # Tags applied to this module. These help with module discovery in online galleries.
             Tags = @('DSC')
    
            # A URL to the license for this module.
            # LicenseUri = ''
    
            # A URL to the main website for this project.
             ProjectUri = 'https://github.com/techthoughts2/DeleteDscTmpFile'
    
            # A URL to an icon representing this module.
            # IconUri = ''
    
            # ReleaseNotes of this module
             ReleaseNotes = 'Thanks Microsoft for working with me to come up with this solution.'
    
        } # End of PSData hashtable
    
    } # End of PrivateData hashtable
    
}