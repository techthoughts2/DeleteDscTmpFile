function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.Boolean]
        $ClearMOFSRemove
    )
    if( $ClearMOFSRemove -eq $true)
    {
        $results = Get-TmpDscFiles
        return @{Name=$Name ; FilePaths= [string[]]$results.FullName}
    }
    else{
        return @{ClearMOFSRemove=$ClearMOFSRemove}
    }
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.Boolean]
        $ClearMOFSRemove
    )
    if ($ClearMOFSRemove -eq $true) {
        Write-Verbose "Removing all mof files from C:\windows\temp ..."
        try {
            Get-ChildItem C:\Windows\Temp\*.mof -Recurse -ErrorAction Stop | Remove-Item -Force -ErrorAction Stop
            Write-Verbose "Complete. All MOFs removed successfully."
        }
        catch {
            Write-Verbose "An error was encountered when trying to cleanup temp MOFs:"            
            Write-Error $_
        }    
    }
    else{
        Write-Verbose "ClearMOFSRemove is set to $ClearMOFSRemove - no action taken"
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.Boolean]
        $ClearMOFSRemove
    )
    $result = $true #assume the best
    Write-Verbose "ClearMOFSRemove is set to: $ClearMOFSRemove"
    if ($ClearMOFSRemove -eq $true) {
        Write-Verbose "Searching for all MOFs in C:\Windows\Temp ..."
        $eval = Get-TmpDscFiles
        $fileFound = $eval | Measure-Object
        if($fileFound.Count -ge 1){
            #there are files
            Write-Verbose "Clear MOFs found in C:\windows\temp - FAIL"
            $result = $false
        }
        else{
            Write-Verbose "No MOF files found in C:\windows\temp"
        }
    }
    $result
}

function Get-TmpDscFiles
{
    $eval = Get-ChildItem C:\Windows\Temp\*.mof -Recurse
    return $eval
}

Export-ModuleMember -Function *-TargetResource

