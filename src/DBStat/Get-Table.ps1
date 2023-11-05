﻿function Get-Table {

<#
.DESCRIPTION
    테이블의 사용여부를 조사하여 결과를 콘솔 또는 파일로 출력

.PARAMETER FolderName
    검색할 패스의 root 위치(폴더명)

.PARAMETER DbName
    데이터베이스 명

.PARAMETER OutType
    C  - 콘솔 출력
    F  - 파일 출력

.EXAMPLE
    Find-CadianTable community NEW_CADIAN C
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

    $SrcPath = "D:\inetpub\cadian.com\_html\admin.cadian.com\" + $FolderName
    $TablePath = "C:\work\202311\Tables-" + $DbName + ".txt"
    $OutFilePath = "C:\work\admin\" + $FolderName + "\" + $DbName + "-Tables.txt"

    Write-Host "> Source Folder:" $SrcPath
    Write-Host "> Table List   :" $TablePath
    Write-Host "> Out File     :" $OutFilePath

    $Contents = "";

    if(!(Test-Path -Path ("C:\work\admin\" + $FolderName))) {
        New-Item -ItemType Directory -Path ("C:\work\admin\" + $FolderName)
    }

    foreach($Table in Get-Content $TablePath) {
        $Table = $Table.trim()

        $Results = Get-ChildItem $SrcPath -Recurse | Select-String -Pattern $Table | Select-Object FileName, Pattern, LineNumber, Line
        $Contents += ("{0,-30}" -f $Table)

        if($Results.Count -eq 0) {
            $Contents += ("{0,  7}" -f $Results.Count)
        } else {
            $Contents += ("{0,  7}" -f $Result.Count) + " <====="
        }
        $Contents += "`n"
    }

    if($OutType -eq "C") {
        Write-Host $Contents
    } else {
        $Contents | Out-File -FilePath $OutFilePath
    }
}