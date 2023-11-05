# discover all ps1 file(s) in Public and Private paths
$itemSplat = @{
    Filter      = '*.ps1'
    Recurse     = $true
    ErrorAction = 'Stop'
}

try {
    $public = @(Get-ChildItem -Path "$PSScriptRoot" @itemSplat)
    Write-Host $public.Basename
}
catch {
    Write-Error $_
    throw 'Unable to get get file information from src.'
}

# dot source all .ps1 file(s) found
foreach ($file in @($public)) {
    try {
        . $file.FullName
    }
    catch {
        throw "Unable to dot source [$($file.FullName)]"

    }
}

# export all public functions
Export-ModuleMember -Function $public.Basename
