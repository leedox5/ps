function Invoke-ColumnUsage {
    <#
    .DESCRIPTION
        Get-ColumnUsage를 반복 수행

    .PARAMETER FolderName
        테이블 정의 파일의 위치(폴더명)

    .PARAMETER OutType함
        C  - 콘솔 출력
        F  - 파일 출력

    .EXAMPLE
        Invoke-ColumnUsage admin\etc C
        Invoke-ColumnUsage ROOT C
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position=0)]
        [string]$FolderName,
        [Parameter(Mandatory, Position=2)]
        [string]$OutType
    )

    $config = Get-Content C:\DBStat\config.json | ConvertFrom-Json;

    if($FolderName -eq "ROOT") {
        $srcPath = $config.outRoot + "\TB*.txt"
    } else {
        $srcPath = $config.outRoot + "\" + $FolderName + "\TB*.txt"
    }

    $src = @(Get-ChildItem -Path $srcPath -Exclude "*R1.txt")

    foreach ($file in @($src)) {
        try {
            Write-Host $file.Basename
            Get-ColumnUsage $FolderName $file.Basename $OutType
        }
        catch {
            throw "Unable to dot source [$($file.FullName)]"

        }
    }
}