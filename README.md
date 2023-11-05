# DBStat Module

## import a module by specifying the manifest

    Import-Module .\DBStat.psd1

## we can confirm that the module is loaded

    Get-Module DBStat

## now that the module is imported we can see what commands are available

    Get-Command -Module DBStat
