function Get-ColumnAlter {

<#
.DESCRIPTION
    사용된 적이 없는 컬럼에 대해 ALTER 문장을 생성

.PARAMETER FolderName
    테이블 정의 파일의 위치(폴더명)

.PARAMETER TableName
    테이블 명

.PARAMETER OutType
    C  - 콘솔 출력
    F  - 파일 출력

.EXAMPLE
    Get-ColumnAlter community TB_BBS C
#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position=0)]
        [string]$FolderName,
        [Parameter(Mandatory, Position=1)]
        [string]$TableName,
        [Parameter(Mandatory, Position=2)]
        [string]$OutType
    )

    $config = Get-Content ($PSScriptRoot + "\config.json") | ConvertFrom-Json;

    $Contents = "";
    $Cnt = 0;

    $SrcPath = $config.outRoot + "\" + $FolderName + "\" + $TableName + "-R1.txt";
    $OutPath = $config.outRoot + "\" + $FolderName + "\" + $TableName + "-ALTER.txt";

    Write-Verbose -Message "Source: $SrcPath"
    Write-Verbose -Message "Output: $OutPath"

    $Contents += "-- Created: "
    $Contents += Get-Date -Format "yyyy.MM.dd HH:mm:ss"
    $Contents += "`n`n"

    foreach($Col in Get-Content $SrcPath) {
        Write-Verbose -Message "Processing for $Col ..."
        if($Col -match "<=====") {
            if($Cnt -gt 0) {
                $Contents += "`n"
            }
            $Contents += "ALTER TABLE $TableName DROP COLUMN " + $Col.Substring(0,20).trim() + ";"

            $Cnt++;
        }
    }

    if($OutType -eq "C") {
        Write-Host $Contents
    } else {
        $Contents | Out-File -FilePath $OutPath
    }

}