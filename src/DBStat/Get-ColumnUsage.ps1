function Get-ColumnUsage {

<#
.DESCRIPTION
    컬럼리스트를 기준으로 asp 소스에 사용된 횟수를 조사

.PARAMETER FolderName
    테이블 정의 파일의 위치(폴더명)

.PARAMETER TableName
    테이블 명

.PARAMETER OutType함
    C  - 콘솔 출력
    F  - 파일 출력

.EXAMPLE
    Get-ColumnUsage community TB_BBS C
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

    $SrcPathAsp = $config.adminSrcRoot + "*.asp";

    $SrcPath = $config.outRoot + "\" + $FolderName + "\" + $TableName + ".txt";
    $OutPath = $config.outRoot + "\" + $FolderName + "\" + $TableName + "-R1.txt";

    Write-Verbose -Message "AspSource: $SrcPathAsp"
    Write-Verbose -Message "Source: $SrcPath"
    Write-Verbose -Message "Output: $OutPath"

    $Contents += "Created: "
    $Contents += Get-Date -Format "yyyy.MM.dd HH:mm:ss"
    $Contents += "`n`n"

    foreach($Col in Get-Content $SrcPath) {

        #Write-Verbose -Message "Searching for $Col ..."

        $Col = $Col.trim()
        $Results = Get-ChildItem $SrcPathAsp -Recurse | Select-String -CaseSensitive -Pattern $Col

        $Contents += ("{0,-20}" -f $Col)
        if($Results.Count -eq 0) {
            $Contents += ("{0,  7}" -f $Results.Count) + " <====="
        } else {
            $Contents += ("{0,  7}" -f $Results.Count)
        }
        $Contents += "`n"
    }

    if($OutType -eq "C") {
        Write-Host $Contents
    } else {
        $Contents | Out-File -FilePath $OutPath
    }
}