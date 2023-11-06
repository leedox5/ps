<#
.DESCRIPTION
    DB의 테이블 목록을 콘솔 또는 파일로 출력

.PARAMETER DbName
    데이터베이스 명

.PARAMETER OutType
    C  - 콘솔 출력
    F  - 파일 출력

.EXAMPLE
    Get-Table NEW_CADIAN C
#>

function Get-Table {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position=1)]
        [string]$DbName,
        [Parameter(Mandatory, Position=2)]
        [string]$OutType
    )

    $config = Get-Content C:\DBStat\config.json | ConvertFrom-Json;

    if(!(Test-Path -Path $config.outRoot)) {
        New-Item -ItemType Directory -Path $config.outRoot | Out-Null
    }

    $OutFilePath = $config.outRoot + "\Tables-" + $DbName + ".txt"
    $sqlPath = $PSScriptRoot + "\db.sql"

    Write-Verbose $OutFilePath
    Write-Verbose $sqlPath

    if($OutType -eq "C") {
        sqlcmd -U $config.dbUser -P $config.dbPass -d $DbName -h -1 -i $sqlPath
    } else {
        sqlcmd -U $config.dbUser -P $config.dbPass -d $DbName -h -1 -i $sqlPath | Out-File -FilePath $OutFilePath
    }

}