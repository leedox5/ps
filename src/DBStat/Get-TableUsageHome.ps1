﻿function Get-TableUsageHome {
<#
.DESCRIPTION
    테이블의 사용여부를 조사하여 결과를 콘솔 또는 파일로 출력(wwww용)

.PARAMETER FolderName
    검색할 패스의 root 위치(폴더명)

.PARAMETER DbName
    데이터베이스 명

.PARAMETER OutType
    C  - 콘솔 출력
    F  - 파일 출력

.EXAMPLE
    Get-TableUsageHome kr\community NEW_CADIAN C
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

    $config = Get-Content C:\DBStat\config.json | ConvertFrom-Json;

    $SrcPath = $config.wwwSrcRoot + $FolderName
    $TablePath = $config.outRoot + "\Tables-" + $DbName + ".txt"

    $OutPath = $config.outRoot + "\www\" + $FolderName

    $OutFilePath = $OutPath + "\Tables-" + $DbName + "-R1.txt"

    Write-Host "> Source Folder:" $SrcPath
    Write-Host "> Table List   :" $TablePath
    Write-Host "> Out File     :" $OutFilePath

    $Contents = "";

    if(!(Test-Path -Path $OutPath)) {
        New-Item -ItemType Directory -Path $OutPath
    }

    foreach($Table in Get-Content $TablePath) {
        $Table = $Table.trim()

        $Results = Get-ChildItem $SrcPath -Recurse | Select-String -Pattern $Table
        $Contents += ("{0,-30}" -f $Table)

        if($Results.Count -eq 0) {
            $Contents += ("{0,  7}" -f $Results.Count)
        } else {
            $Contents += ("{0,  7}" -f $Results.Count) + " <====="
        }
        $Contents += "`n"
    }

    if($OutType -eq "C") {
        Write-Host $Contents
    } else {
        $Contents | Out-File -FilePath $OutFilePath
    }
}
