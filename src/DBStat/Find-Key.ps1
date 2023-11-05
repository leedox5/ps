#region data

#endregion
<#
.SYNOPSIS
    Short description
.DESCRIPTION
    Long description
.EXAMPLE
    C:\PS>
    Example of how to use this cmdlet
.EXAMPLE
    C:\PS>
    Another example of how to use this cmdlet
.PARAMETER InputObject
    Specifies the object to be processed.  You can also pipe the objects to this command.
.OUTPUTS
    Output from this cmdlet (if any)
.NOTES
    General notes
.COMPONENT
    The component this cmdlet belongs to
#>    
function Find-Key {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position = 0)]
        $Path,
        [Parameter(Mandatory, Position = 1)]
        $Key
    )
    Get-ChildItem $Path -Recurse | Select-String -Pattern $Key -CaseSensitive | Select-Object Path, Line 
}