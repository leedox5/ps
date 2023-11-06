<#
.DESCRIPTION
    alter 문 실행

.PARAMETER DbName
    데이터베이스 명

.PARAMETER OutType
    C  - 콘솔 출력
    F  - 파일 출력

.EXAMPLE
    Set-Column NEW_CADIAN TB_PRODUCT-ALTER.txt
#>

function Set-Column {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position=0)]
        [string]$DbName,
        [Parameter(Mandatory, Position=1)]
        [string]$SqlPath
    )

    $config = Get-Content C:\DBStat\config.json | ConvertFrom-Json;

    $SrcPath = $config.target + "\" + $SqlPath;

    if(!(Test-Path -Path $SrcPath)) {
        Write-Error "File not found : $SrcPath"
    } else {
        sqlcmd -U $config.dbUser -P $config.dbPass -d $DbName -h -1 -i $SrcPath
    }
}