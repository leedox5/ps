function Get-Column {

<#
.DESCRIPTION
    테이블 목록중 사용된 것을 기준으로 컬럼 목록을 가져온다

.PARAMETER FolderName
    테이블 목록 파일의 위치(폴더명)

.PARAMETER DbName
    데이터베이스 명

.PARAMETER OutType
    C  - 콘솔 출력
    F  - 파일 출력

.EXAMPLE
    Get-Column community NEW_CADIAN C
#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position=0)]
        [string]$FolderName,
        [Parameter(Mandatory, Position=1)]
        [string]$DbName,
        [Parameter(Mandatory, Position=2)]
        [string]$OutType
    )

    $config = Get-Content C:\DBStat\config.json  | ConvertFrom-Json;

    $SrcFilePath = $config.outRoot + "\" + $FolderName + "\" + $DbName + "-Tables-R1.txt";

    $sqlPath = $PSScriptRoot + "\col.sql"

    foreach($Table in Get-Content $SrcFilePath) {
        if($Table -match "<=====") {
            $TableName = $Table.Substring(0, 20).trim()
            $OutFilePath = $config.outRoot + "\" + $FolderName + "\" + $TableName + ".txt"
            if($OutType -eq "C") {
                sqlcmd -U $config.dbUser -P $config.dbPass -d $DbName -v NAME = $TableName -h -1 -i $sqlPath
            } else {
                sqlcmd -U $config.dbUser -P $config.dbPass -d $DbName -v NAME = $TableName -h -1 -i $sqlPath | Out-File -FilePath $OutFilePath
            }
            Write-Host "`n"
        }
    }

}